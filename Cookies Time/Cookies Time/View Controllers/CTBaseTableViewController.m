//
//  CTBaseTableViewController.m
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTBaseTableViewController.h"

@interface CTBaseTableViewController ()

@end

@implementation CTBaseTableViewController


- (void)showProgress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    });
}

- (void)hideProgress
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
    });
}

- (void)showAlert:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:message
                          message:nil
                          delegate:nil
                          cancelButtonTitle:@"Ok"
                          otherButtonTitles:nil];
    [alert show];
}


@end
