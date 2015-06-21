//
//  CTProductsTableViewController.h
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CTBaseTableViewController.h"
#import "CTProductTableViewCell.h"

@interface CTProductsTableViewController : CTBaseTableViewController
@property (nonatomic, strong) CTCategory *category;

+ (NSString *)segueIdentifier;

@end
