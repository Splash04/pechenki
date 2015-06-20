//
//  CTProduct.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTProduct.h"
#import "NSDictionary+JSONValidation.h"
#import "CTServerConstants.h"

@implementation CTProduct


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    if(attributes != nil) {
        self.identifier = [attributes stringForKey:kTeamIdentifier ifNull:nil];
        self.name = [attributes stringForKey:kName ifNull:nil];
        self.productWeight = [attributes stringForKey:kProductWeight ifNull:nil];
        self.imageUrl = [attributes stringForKey:kImagePath ifNull:nil];
        self.categoryId = [attributes stringForKey:kCategoryId ifNull:nil];
        NSDictionary *categoryDictionary = [attributes objectForKey:kCategory ifNull:nil];
        if(categoryDictionary != nil) {
            self.category = [[CTCategory alloc] initWithAttributes:categoryDictionary];
        } else {
             NSLog(@"Category for product %@ is null", self.identifier);
        }
    } else {
        NSLog(@"Product data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.identifier forKey:kTeamIdentifier];
    [dictionary safeSetValue:self.name forKey:kName];
    [dictionary safeSetValue:self.productWeight forKey:kProductWeight];
    [dictionary safeSetValue:self.imageUrl forKey:kImagePath];
    [dictionary safeSetValue:self.categoryId forKey:kCategoryId];
    [dictionary safeSetValue:[self.category attributs] forKey:kCategory];
    return dictionary;
}

@end
