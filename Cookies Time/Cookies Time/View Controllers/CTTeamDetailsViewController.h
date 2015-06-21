//
//  CTTeamDetailsViewController.h
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTBaseViewController.h"
#import "CTTeam.h"

@interface CTTeamDetailsViewController : CTBaseViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) CTTeam *team;

+ (NSString *)segueIdentifier;

@end
