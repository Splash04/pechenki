//
//  CTPeopleListViewController.h
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTBaseTableViewController.h"

@interface CTPeopleListViewController : CTBaseTableViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) CTTeam *team;

+ (NSString *)segueIdentifier;

@end
