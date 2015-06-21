//
//  CTTwit.m
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTTwit.h"

@implementation CTTwit

- (instancetype)initWithText:(NSString *)text withImagePath:(NSString *)imagePath {
    self = [super init];
    if (!self) {
        return nil;
    }
    self.text = text;
    self.imagePath = imagePath;
    
    return self;
}

@end
