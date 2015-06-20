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

@end
