//
//  CTSession.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTUser.h"
#import "CTUserOrder.h"

@interface CTSession : NSObject

@property (nonatomic, strong) CTUser *user;
@property (nonatomic, strong) CTUserOrder *userOrder;

+ (instancetype)sharedInstance;
+ (void)addProduct:(CTProduct *)product;
+ (void)removeProduct:(CTProduct *)product;
+ (BOOL)isContainInCurrentUserOrder:(CTProduct *)product;

@end
