//
//  CTLoginViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTLoginViewController.h"
#import "CTTeamsViewController.h"

@interface CTLoginViewController ()

@property (strong, nonatomic) IBOutlet UITextField *login;
@property (strong, nonatomic) IBOutlet UITextField *password;

@end

@implementation CTLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)loginTap:(id)sender {
    [self showProgress];
    
    [CTDataManager loginWithUser:@"igor.kharitoniuk" password:@"1427booM02" withResultBlock:^(CTUser *user, NSError *error) {
        [self hideProgress];
        if(error != nil) {
            NSLog(@"Login error: %@", error);
            [self showAlert:@"Login error"];
        } else {
            [CTSession sharedInstance].user = user;
            [self performSegueWithIdentifier:[CTTeamsViewController segueIdentifier] sender: self];
        }
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
