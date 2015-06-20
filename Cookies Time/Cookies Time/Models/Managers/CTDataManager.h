//
//  CTDataManager.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTUser.h"
#import "CTTeam.h"
#import "CTUserOrder.h"
#import "CTRestaurant.h"

@interface CTDataManager : NSObject

+ (instancetype)sharedInstance;
+ (NSURLSessionDataTask *)loginWithUser:(NSString *)user password:(NSString *)password withResultBlock:(void (^)(CTUser *user, NSError *error))block;
+ (NSURLSessionDataTask *)getAllTeamsWithResultBlock:(void (^)(NSArray *teams, NSError *error))block;
+ (NSURLSessionDataTask *)getTeamsForUser:(CTUser *)user withResultBlock:(void (^)(NSArray *teams, NSError *error))block;
+ (NSURLSessionDataTask *)createTeam:(CTTeam *)team withResultBlock:(void (^)(NSError *error))block;
+ (NSURLSessionDataTask *)createUserOrder:(CTUserOrder *)userOrder withResultBlock:(void (^)(NSError *error))block;
+ (NSURLSessionDataTask *)getProductCategoryForRestaurant:(CTRestaurant *)restaurant withResultBlock:(void (^)(NSArray *categories, NSError *error))block;
+ (NSURLSessionDataTask *)getProductsForCategory:(CTCategory *)category withResultBlock:(void (^)(NSArray *products, NSError *error))block;
+ (NSURLSessionDataTask *)joinTeam:(CTTeam *)team forUser:(CTUser *)user withResultBlock:(void (^)(NSError *error))block;

@end
