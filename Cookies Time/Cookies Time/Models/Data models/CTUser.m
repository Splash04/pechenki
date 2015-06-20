//
//  CTUser.m
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTUser.h"
#import "CTServerConstants.h"
#import "NSDictionary+JSONValidation.h"

@implementation CTUser

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    if(attributes != nil) {
        self.name = [attributes stringForKey:kName ifNull:nil];
        self.email = [attributes stringForKey:kEmail ifNull:nil];
        self.phoneNumber = [attributes stringForKey:kPhoneNumber ifNull:nil];
        self.imagePath = [attributes stringForKey:kImagePath ifNull:nil];
        self.identifier = [attributes stringForKey:kUserId ifNull:nil];
    } else {
        NSLog(@"User data is empty");
    }
    
    return self;
}

- (NSMutableDictionary *)attributs {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [dictionary safeSetValue:self.name forKey:kName];
    [dictionary safeSetValue:self.email forKey:kEmail];
    [dictionary safeSetValue:self.phoneNumber forKey:kPhoneNumber];
    [dictionary safeSetValue:self.imagePath forKey:kImagePath];
    [dictionary safeSetValue:self.identifier forKey:kUserId];
    
    return dictionary;
}

@end
