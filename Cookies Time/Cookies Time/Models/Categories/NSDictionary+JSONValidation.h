//
//  NSDictionary+JSONValidation.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONValidation)

- (NSString *)stringForKey:(id)aKey ifNull:(NSString *)aValue;
- (NSInteger)integerForKey:(id)aKey ifNull:(NSInteger)aValue;
- (id)objectForKey:(id)aKey ifNull:(id)aObject;

- (void)safeSetValue:(id)value forKey:(NSString *)key;

@end
