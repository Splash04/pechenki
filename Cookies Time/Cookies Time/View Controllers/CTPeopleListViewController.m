//
//  CTPeopleListViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTPeopleListViewController.h"
#import "CTPeopleTableViewCell.h"
#import "UIImageView+AFNetworking.h"

@interface CTPeopleListViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation CTPeopleListViewController

+ (NSString *)segueIdentifier
{
    static NSString *cellIdentifier = nil;
    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        cellIdentifier = NSStringFromClass([self class]);
    });
    return cellIdentifier;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self showProgress];
    [CTDataManager getUsersForGroup:self.team withResultBlock:^(NSArray *users, NSError *error) {
        [self hideProgress];
        if(error != nil) {
            NSLog(@"People error: %@", error);
        } else {
            self.dataArray = [users mutableCopy];
            [self.tableView reloadData];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTPeopleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTPeopleTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTPeopleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTPeopleTableViewCell.cellIdentifier];
    }
    CTUser *user = (CTUser *)self.dataArray[indexPath.row];
#warning !!!!
    cell.FIO.text = user.name;// @"FIO";//((CTTeam *)self.dataArray[indexPath.row]).name;
    cell.balance.text = @"35 000 б.р";
    
    NSURL *url = [NSURL URLWithString:user.imagePath];
    [cell.photo setImageWithURL:url placeholderImage:[UIImage imageNamed:@"userIcon"]];
    
    return cell;
}

@end
