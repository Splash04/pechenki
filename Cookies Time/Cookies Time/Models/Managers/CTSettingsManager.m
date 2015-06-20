//
//  CTSettingsManager.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTSettingsManager.h"

@implementation CTSettingsManager

+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [self new];
    });
    return sharedInstance;
}

@end
