//
//  CTCategoriesViewController.m
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTCategoriesViewController.h"
#import "CTTwitterTableViewCell.h"

@interface CTCategoriesViewController ()

@end

@implementation CTCategoriesViewController

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
    [self loadData];
}

- (void)loadData
{
    [self showProgress];
    [CTDataManager getProductCategoryForRestaurant:self.restaurant withResultBlock:^(NSArray *categories, NSError *error) {
        [self hideProgress];
        if(error == nil) {
            self.dataArray = [categories mutableCopy];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
            });
        } else {
            NSLog(@"Error: %@", error);
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTTwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTTwitterTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTTwitterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTTwitterTableViewCell.cellIdentifier];
    }
    
#warning !!!!
    CTCategory *category = (CTCategory *)self.dataArray[indexPath.row];
    cell.twitterText.text =  category.name;//((CTTeam *)self.dataArray[indexPath.row]).name;
    //cell.twitterImage.text = ((CTTeam *)self.dataArray[indexPath.row]).info;
    
    return cell;
    
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    if ([[segue identifier] isEqualToString:[CTPeopleListViewController segueIdentifier]]) {
//        CTPeopleListViewController *peopleViewController = [segue destinationViewController];
//        peopleViewController.team = self.team;
//    }
    
}

@end
