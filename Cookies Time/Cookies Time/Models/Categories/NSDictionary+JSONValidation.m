//
//  NSDictionary+JSONValidation.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "NSDictionary+JSONValidation.h"

@implementation NSDictionary (JSONValidation)

- (NSString *)stringForKey:(id)aKey ifNull:(NSString *)aValue
{
    if (!aKey) return aValue;
    
    id result = [self objectForKey:aKey];
    if ([result isKindOfClass:[NSString class]])
    {
        return result;
    }
    
    return aValue;
}

- (NSInteger)integerForKey:(id)aKey ifNull:(NSInteger)aValue
{
    if (!aKey) return aValue;
    id result = [self objectForKey:aKey];
    if ([result isKindOfClass:[NSNumber class]] || [result isKindOfClass:[NSString class]])
    {
        NSInteger value = [result integerValue];
        if (!isnan(value)) return value;
    }
    
    return aValue;
}

- (double)doubleForKey:(id)aKey ifNull:(double)aValue
{
    if (!aKey) return aValue;
    
    id result = [self objectForKey:aKey];
    if ([result isKindOfClass:[NSNumber class]] || [result isKindOfClass:[NSString class]])
    {
        double value = [result doubleValue];
        if (!isnan(value)) return value;
    }
    
    return aValue;
}

- (id)objectForKey:(id)aKey ifNull:(id)aObject
{
    id result = [self objectForKey:aKey];
    if (result != [NSNull null])
    {
        return result;
    }
    else
    {
        return aObject;
    }
    
    return nil;
}

- (void)safeSetValue:(nullable id)value forKey:(nonnull NSString *)key
{
    if(value != nil) {
        [self setValue:value forKey:key];
    } else {
        NSLog(@"Value for key %@ is Null", key);
    }
}

@end
