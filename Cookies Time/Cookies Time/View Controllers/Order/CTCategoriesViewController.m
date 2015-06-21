//
//  CTCategoriesViewController.m
//  Cookies Time
//
//  Created by Splash on 6/21/15.
//  Copyright © 2015 Splash. All rights reserved.
//

#import "CTCategoriesViewController.h"
#import "CTCategorieTableViewCell.h"
#import "CTProductsTableViewController.h"

@interface CTCategoriesViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) CTCategory *category;

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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTCategorieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTCategorieTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTCategorieTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTCategorieTableViewCell.cellIdentifier];
    }
    
    CTCategory *category = (CTCategory *)self.dataArray[indexPath.row];
    cell.categorie.text =  category.name;//((CTTeam *)self.dataArray[indexPath.row]).name;
    //cell.twitterImage.text = ((CTTeam *)self.dataArray[indexPath.row]).info;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.category = (CTCategory *)self.dataArray[indexPath.row];
    [self performSegueWithIdentifier:[CTProductsTableViewController segueIdentifier] sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:[CTProductsTableViewController segueIdentifier]]) {
        CTProductsTableViewController *peopleViewController = [segue destinationViewController];
        peopleViewController.category = self.category;
    }
}

@end
