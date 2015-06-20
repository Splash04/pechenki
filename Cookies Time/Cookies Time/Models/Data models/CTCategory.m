//
//  CTCategory.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTCategory.h"
#import "NSDictionary+JSONValidation.h"
#import "CTServerConstants.h"

@implementation CTCategory

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    if(attributes != nil) {
        self.identifier = [attributes stringForKey:kCategoryId ifNull:nil];
        self.name = [attributes stringForKey:kName ifNull:nil];
    } else {
        NSLog(@"Category data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.identifier forKey:kCategoryId];
    [dictionary safeSetValue:self.name forKey:kName];
    
    return dictionary;
}

@end
