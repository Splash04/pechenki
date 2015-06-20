//
//  CTUserOrder.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTUser.h"
#import "CTTeam.h"
#import "CTProduct.h"

@interface CTUserOrder : NSObject

@property (nonatomic, strong) CTUser *user;
@property (nonatomic, strong) CTTeam *team;
@property (nonatomic, strong) NSArray *products;

- (NSMutableDictionary *)attributs;

@end
