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

+ (NSURLSessionDataTask *)loginWithUser:(NSString *)user password:(NSString *)password withResultBlock:(void (^)(CTUser *user, NSError *error))block{
    return [[CTHTTPSessionManager sharedInstance] GET:kApiPathLogin parameters:nil success:^(NSURLSessionDataTask * __unused task, id JSON) {
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

+ (NSError *)errorWithCode:(NSInteger)errorCode errorMessage:(NSString *)errorMessage {
    NSArray *keys = [NSArray arrayWithObjects: NSLocalizedDescriptionKey, nil];
    NSArray *values = [NSArray arrayWithObjects:errorMessage, nil];
    NSDictionary *userDict = [NSDictionary dictionaryWithObjects:values forKeys:keys];

    return [[NSError alloc] initWithDomain:kServerAddress code:errorCode userInfo:userDict];
}

@end
