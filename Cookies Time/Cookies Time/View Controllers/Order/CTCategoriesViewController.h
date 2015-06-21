//
//  CTCategoriesViewController.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTBaseTableViewController.h"
#import "CTTeam.h"

@interface CTCategoriesViewController : CTBaseTableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) CTTeam *team;

@property (nonatomic, strong) CTRestaurant *restaurant;
+ (NSString *)segueIdentifier;
@end
