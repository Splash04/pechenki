//
//  CTProduct.h
//  Cookies Time
//
//  Created by Splash on 6/20/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTCategory.h"

@interface CTProduct : NSObject

@property (nonatomic, strong) NSString *identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double price;
@property (nonatomic, strong) NSString *productWeight;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, strong) NSString *categoryId;
@property (nonatomic, strong) CTCategory *category;

- (instancetype)initWithAttributes:(NSDictionary *)attributes;
- (NSMutableDictionary *)attributs;

@end
