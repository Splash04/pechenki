//
//  CTUser.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTUser : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *phoneNumber;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
