//
//  CTSession.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTUser.h"

@interface CTSession : NSObject

@property (nonatomic, retain) CTUser *user;
+ (instancetype)sharedInstance;

@end
