//
//  CTTwit.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTTwit : NSObject

@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *imagePath;

- (instancetype)initWithText:(NSString *)text withImagePath:(NSString *)imagePath;

@end
