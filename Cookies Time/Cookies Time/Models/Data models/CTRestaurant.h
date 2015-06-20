//
//  CTRestaurant.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTProduct.h"

@interface CTRestaurant : NSObject

@property (nonatomic, strong) NSString *restaurantId;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *phoneNumber;
@property (nonatomic, strong) NSString *restaurantAddress;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSMutableArray *products;

- (NSMutableDictionary *)attributs;
- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end