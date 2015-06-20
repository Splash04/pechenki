//
//  CTHTTPSessionManager.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "AFHTTPSessionManager.h"

@interface CTHTTPSessionManager : AFHTTPSessionManager

+ (instancetype)sharedInstance;

@end
