//
//  CTBaseTableViewController.h
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
#import "CTDataManager.h"
#import "CTSession.h"

@interface CTBaseTableViewController : UITableViewController

- (void)showProgress;
- (void)hideProgress;
- (void)showAlert:(NSString *)message;

@end
