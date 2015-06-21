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
    if(attributes != nil) {
        NSInteger teamId = [attributes integerForKey:kTeamIdentifier ifNull:0];
        if(teamId != 0) {
            self.identifier = [NSString stringWithFormat:@"%ld", (long)teamId];
        }
        //self.identifier = [attributes stringForKey:kTeamIdentifier ifNull:nil];
        self.name = [attributes stringForKey:kName ifNull:nil];
        self.imagePath = [attributes stringForKey:kImagePath ifNull:nil];
        self.tag = [attributes stringForKey:kTag ifNull:nil];
        self.info = [attributes stringForKey:kInfo ifNull:nil];
    } else {
        NSLog(@"Team data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.identifier forKey:kTeamIdentifier];
    [dictionary safeSetValue:self.name forKey:kName];
    [dictionary safeSetValue:self.imagePath forKey:kImagePath];
    [dictionary safeSetValue:self.tag forKey:kTag];
    [dictionary safeSetValue:self.info forKey:kInfo];
    
    return dictionary;
}

@end
