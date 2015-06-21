//
//  CTSession.m
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTSession.h"

@implementation CTSession

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

+ (void)addProduct:(CTProduct *)product {
    if(! [self isContainInCurrentUserOrder:product]) {
        [[CTSession sharedInstance].userOrder.products addObject:product];
    }
}

+ (void)removeProduct:(CTProduct *)product {
    if([CTSession isContainInCurrentUserOrder:product]) {
        CTUserOrder *userOrder = [CTSession sharedInstance].userOrder;
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", product.identifier];
        NSArray *containedList = [userOrder.products filteredArrayUsingPredicate:predicate];
        if([containedList count] == 1) {
            [userOrder.products removeObject:containedList[0]];
        }
    }
}

+ (BOOL)isContainInCurrentUserOrder:(CTProduct *)product
{
    CTUserOrder *userOrder = [CTSession sharedInstance].userOrder;
    if(userOrder == nil) {
        userOrder = [CTUserOrder new];
        userOrder.products = [NSMutableArray new];
        [CTSession sharedInstance].userOrder = userOrder;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"identifier == %@", product.identifier];
    NSArray *containedList = [userOrder.products filteredArrayUsingPredicate:predicate];
    return [containedList count] > 0;
}

@end
