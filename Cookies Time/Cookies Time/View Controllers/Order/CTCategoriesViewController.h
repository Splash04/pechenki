//
//  CTCategoriesViewController.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTTeamDetailsViewController.h"

@interface CTCategoriesViewController : CTTeamDetailsViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) CTRestaurant *restaurant;
+ (NSString *)segueIdentifier;
@end
