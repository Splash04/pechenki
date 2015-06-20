//
//  CTCategory.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTCategory : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (NSMutableDictionary *)attributs;

@end
