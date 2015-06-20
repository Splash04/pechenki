//
//  CTUserOrder.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTUserOrder.h"
#import "NSDictionary+JSONValidation.h"
#import "CTServerConstants.h"

@implementation CTUserOrder

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:[self.user attributs] forKey:kTeamIdentifier];
    [dictionary safeSetValue:[self.team attributs]  forKey:kTeam];
    
    if([self.products count] > 0) {
            NSMutableArray *productsDictionaryArray = [[NSMutableArray alloc] initWithCapacity:[self.products count]];
        for (CTProduct *product in self.products) {
            [productsDictionaryArray addObject:[product attributs]];
        }
        [dictionary safeSetValue:productsDictionaryArray forKey:kProducts];
    } else {
        NSLog(@"User order didn't contain products");
    }
    
    return dictionary;
}

@end
