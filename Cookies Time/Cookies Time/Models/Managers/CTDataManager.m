//
//  CTDataManager.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTDataManager.h"
#import "CTHTTPSessionManager.h"
#import "CTServerConstants.h"
#import "NSDictionary+JSONValidation.h"

@implementation CTDataManager

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

+ (NSURLSessionDataTask *)loginWithUser:(NSString *)user password:(NSString *)password withResultBlock:(void (^)(CTUser *user, NSError *error))block {
    NSDictionary *parameters = @{kUser : user,
                                 kPassword : password};
    NSLog(@"Login dictionary: %@", parameters);
    return [[CTHTTPSessionManager sharedInstance] POST:kApiPathLogin parameters:parameters success:^(NSURLSessionDataTask * __unused task, id JSON) {
        
        NSLog(@"loginSuccess: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        NSString *dataType = [JSON stringForKey:kDataType ifNull:nil];
        if([dataType length] == 0) {
            errorCode = -2;
        }
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"DataError"]];
            if (block) {
                block(nil, error);
            }
        } else {
            CTUser *user = [[CTUser alloc] initWithAttributes:[JSON objectForKey:dataType ifNull:nil]];
            if(block) {
                block(user, nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)getAllTeamsWithResultBlock:(void (^)(NSArray *teams, NSError *error))block {
    return [self getTeamsForUser:nil withResultBlock:block];
}

+ (NSURLSessionDataTask *)getTeamsForUser:(CTUser *)user withResultBlock:(void (^)(NSArray *teams, NSError *error))block {
    NSString *apiPath = nil;
    if(user != nil) {
        apiPath = [NSString stringWithFormat:@"%@\\%@=%@", kApiPathTeams, kUserId, user.identifier];
    } else {
        apiPath = kApiPathTeams;
    }
    NSLog(@"get team: %@", apiPath);
    return [[CTHTTPSessionManager sharedInstance] GET:apiPath parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"teams: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        NSString *dataType = [JSON stringForKey:kDataType ifNull:nil];
        if([dataType length] == 0) {
            errorCode = -2;
        }
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(nil, error);
            }
        } else {
            if(block) {
                NSArray *dataArray = [JSON objectForKey:dataType ifNull:nil];
                NSMutableArray *teamsArray = [NSMutableArray arrayWithCapacity:[dataArray count]];
                for (NSDictionary *attributes in dataArray) {
                    CTTeam *team = [[CTTeam alloc] initWithAttributes:attributes];
                    [teamsArray addObject:team];
                }
                block(teamsArray, nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)createTeam:(CTTeam *)team withResultBlock:(void (^)(NSError *error))block {
    
    return [[CTHTTPSessionManager sharedInstance] POST:kApiCreateTeam parameters:[team attributs] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"teams: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(error);
            }
        } else {
            if(block) {
                block(nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(error);
        }
    }];
}

+ (NSURLSessionDataTask *)joinTeam:(CTTeam *)team forUser:(CTUser *)user withResultBlock:(void (^)(NSError *error))block {
    NSDictionary *parameters = @{@"userId" : @"1",
                                 @"teamId" : @"1"};
    //http://10.55.1.27:8888/api/team/join?userId=1&teamId=2
    NSLog(@"Join team dictionary: %@", parameters);
    return [[CTHTTPSessionManager sharedInstance] GET:[NSString stringWithFormat:@"team/join?userId=%@&teamId=%@", @"1", @"1"] parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"teams: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(error);
            }
        } else {
            if(block) {
                block(nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(error);
        }
    }];
}

+ (NSURLSessionDataTask *)createUserOrder:(CTUserOrder *)userOrder withResultBlock:(void (^)(NSError *error))block {
    return [[CTHTTPSessionManager sharedInstance] POST:kApiUpdateUserOrder parameters:[userOrder attributs] success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"UserOrder success: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(error);
            }
        } else {
            if(block) {
                block(nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(error);
        }
    }];
}

+ (NSURLSessionDataTask *)getProductCategoryForRestaurant:(CTRestaurant *)restaurant withResultBlock:(void (^)(NSArray *categories, NSError *error))block {
    return [[CTHTTPSessionManager sharedInstance] GET:[NSString stringWithFormat:@"%@?%@=%@", kGetCategories, kRestaurantId, restaurant.restaurantId] parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"ProductCategoryForRestaurant success: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        NSString *dataType = [JSON stringForKey:kDataType ifNull:nil];
        if([dataType length] == 0) {
            errorCode = -2;
        }
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(nil, error);
            }
        } else {
            if(block) {
                NSArray *dataArray = [JSON objectForKey:dataType ifNull:nil];
                NSMutableArray *categoriesArray = [NSMutableArray arrayWithCapacity:[dataArray count]];
                for (NSDictionary *attributes in dataArray) {
                    CTCategory *category = [[CTCategory alloc] initWithAttributes:attributes];
                    [categoriesArray addObject:category];
                }
                block(categoriesArray, nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSURLSessionDataTask *)getProductsForCategory:(CTCategory *)category withResultBlock:(void (^)(NSArray *products, NSError *error))block {
    return [[CTHTTPSessionManager sharedInstance] GET:[NSString stringWithFormat:@"%@?%@=%@", kGetProducts, kCategoryId, category.identifier] parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
        NSLog(@"ProductsForCategory success: %@", JSON);
        
        NSInteger errorCode = [JSON integerForKey:kErrorCode ifNull:-1];
        NSString *dataType = [JSON stringForKey:kDataType ifNull:nil];
        if([dataType length] == 0) {
            errorCode = -2;
        }
        
        if(errorCode != 0) {
            NSError *error = [self errorWithCode:errorCode errorMessage:[JSON stringForKey:kErrorMessage ifNull:@"Data error"]];
            if (block) {
                block(nil, error);
            }
        } else {
            if(block) {
                NSArray *dataArray = [JSON objectForKey:dataType ifNull:nil];
                NSMutableArray *productsArray = [NSMutableArray arrayWithCapacity:[dataArray count]];
                for (NSDictionary *attributes in dataArray) {
                    CTProduct *product = [[CTProduct alloc] initWithAttributes:attributes];
                    [productsArray addObject:product];
                }
                block(productsArray, nil);
            }
        }
    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
        if (block) {
            block(nil, error);
        }
    }];
}

+ (NSError *)errorWithCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage {
    NSArray *keys = [NSArray arrayWithObjects: NSLocalizedDescriptionKey, nil];
    NSArray *values = [NSArray arrayWithObjects:errorMessage, nil];
    NSDictionary *userDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];

    return [[NSError alloc] initWithDomain:kServerAddress code:errorCode userInfo:userDict];
}

@end
