//
//  CTOrder.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTOrder.h"
#import "CTServerConstants.h"
#import "NSDictionary+JSONValidation.h"

@implementation CTOrder


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    if(attributes != nil) {
        self.identifier = [attributes stringForKey:kOrederId ifNull:nil];
        self.price = [attributes doubleForKey:kPrice ifNull:0];
        self.teamId = [attributes stringForKey:kTeamIdentifier ifNull:nil];
        self.userid = [attributes stringForKey:kUserId ifNull:nil];
        
        NSArray *productsDictionaryArray = [attributes objectForKey:kProducts ifNull:nil];
        if([productsDictionaryArray count] > 0) {
            self.products = [[NSMutableArray alloc] initWithCapacity:[productsDictionaryArray count]];
            for (NSDictionary *productDictionary in productsDictionaryArray) {
                [self.products addObject:[[CTProduct alloc] initWithAttributes:productDictionary]];
            }
        }
        
        NSDictionary *teamDictionary = [attributes objectForKey:kOrderTeam ifNull:nil];
        if(teamDictionary != nil) {
            self.team = [[CTTeam alloc] initWithAttributes:teamDictionary];
        } else {
            NSLog(@"Team for order %@ is null", self.identifier);
        }
        
        NSDictionary *userDictionary = [attributes objectForKey:kUser ifNull:nil];
        if(userDictionary != nil) {
            self.user = [[CTUser alloc] initWithAttributes:userDictionary];
        } else {
            NSLog(@"User for order %@ is null", self.identifier);
        }
    } else {
        NSLog(@"CTOrder data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.identifier forKey:kOrederId];
    [dictionary safeSetValue:[NSNumber numberWithDouble:self.price] forKey:kPrice];
    [dictionary safeSetValue:self.teamId forKey:kTeamIdentifier];
    [dictionary safeSetValue:self.userid forKey:kUserId];
    
    if([self.products count] > 0) {
        NSMutableArray *productsDictionaryArray = [[NSMutableArray alloc] initWithCapacity:[self.products count]];
        for (CTProduct *product in self.products) {
            [productsDictionaryArray addObject:[product attributs]];
        }
        [dictionary safeSetValue:productsDictionaryArray forKey:kProducts];
    } else {
        NSLog(@"Order isn't contain products");
    }
    
    if(self.team != nil) {
        [dictionary safeSetValue:[self.team attributs] forKey:kOrderTeam];
    } else {
        NSLog(@"Order team is null");
    }
    
    if(self.user != nil) {
        [dictionary safeSetValue:[self.user attributs] forKey:kUser];
    } else {
        NSLog(@"Order user is null");
    }
    
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