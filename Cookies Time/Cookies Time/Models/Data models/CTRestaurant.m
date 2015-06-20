//
//  CTRestaurant.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTRestaurant.h"
#import "NSDictionary+JSONValidation.h"
#import "CTServerConstants.h"

@implementation CTRestaurant

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    if(attributes != nil) {
        self.restaurantId = [attributes stringForKey:kRestaurantId ifNull:nil];
        self.name = [attributes stringForKey:kName ifNull:nil];
        self.phoneNumber = [attributes stringForKey:kPhoneNumber ifNull:nil];
        self.restaurantAddress = [attributes stringForKey:kRestaurantAddress ifNull:nil];
        self.email = [attributes stringForKey:kEmail ifNull:nil];
        
        NSArray *productsDictionaryArray = [attributes objectForKey:kProducts ifNull:nil];
        if([productsDictionaryArray count] > 0) {
            self.products = [[NSMutableArray alloc] initWithCapacity:[productsDictionaryArray count]];
            for (NSDictionary *productDictionary in productsDictionaryArray) {
                [self.products addObject:[[CTProduct alloc] initWithAttributes:productDictionary]];
            }
        }
    } else {
        NSLog(@"Team data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.restaurantId forKey:kRestaurantId];
    [dictionary safeSetValue:self.name forKey:kName];
    [dictionary safeSetValue:self.phoneNumber forKey:kPhoneNumber];
    [dictionary safeSetValue:self.restaurantAddress forKey:kRestaurantAddress];
    [dictionary safeSetValue:self.email forKey:kEmail];
    
    if([self.products count] > 0) {
        NSMutableArray *productsDictionaryArray = [[NSMutableArray alloc] initWithCapacity:[self.products count]];
        for (CTProduct *product in self.products) {
            [productsDictionaryArray addObject:[product attributs]];
        }
        [dictionary safeSetValue:productsDictionaryArray forKey:kProducts];
    } else {
        NSLog(@"Restaurant didn't contain products");
    }
    
    return dictionary;
}

@end