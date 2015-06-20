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
@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *lastName;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (NSMutableDictionary *)attributs;

@end
