//
//  CTTeam.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTTeam.h"
#import "NSDictionary+JSONValidation.h"
#import "CTServerConstants.h"

@implementation CTTeam

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.identifier = [attributes stringForKey:kIdentifier ifNull:nil];
    self.name = [attributes stringForKey:kName ifNull:nil];
    self.imagePath = [attributes stringForKey:kImagePath ifNull:nil];
    self.tag = [attributes stringForKey:kTag ifNull:nil];
    self.info = [attributes stringForKey:kInfo ifNull:nil];
    
    return self;
}

@end
