//
//  CTOrder.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTTeam.h"
#import "CTUser.h"
#import "CTProduct.h"

@interface CTOrder : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *teamId;
@property (nonatomic, strong) NSString *userid;
@property (nonatomic, strong) NSMutableArray *products;
@property (nonatomic, strong) CTTeam *team;
@property (nonatomic, strong) CTUser *user;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;

@end
