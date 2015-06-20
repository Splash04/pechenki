//
//  CTHTTPSessionManager.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTHTTPSessionManager.h"
#import "CTServerConstants.h"

static NSString * const CTServerAPIBaseURLString = kServerAddress;

@implementation CTHTTPSessionManager

+ (instancetype)sharedInstance
{
    static CTHTTPSessionManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CTHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:CTServerAPIBaseURLString]];
        sharedInstance.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    });
    return sharedInstance;
}

@end
