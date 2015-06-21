//
//  CTProductsTableViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTProductsTableViewController.h"
#import "CTCategory.h"
#import "UIImageView+AFNetworking.h"

@interface CTProductsTableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation CTProductsTableViewController

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
    [self showProgress];
    [CTDataManager getProductsForCategory:self.category withResultBlock:^(NSArray *products, NSError *error) {
        [self hideProgress];
        if(error != nil) {
            NSLog(@"Products error: %@", error);
        } else {
            self.dataArray = [products mutableCopy];
            [self.tableView reloadData];
        }
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dataArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CTProduct *selectedProduct = self.dataArray[indexPath.row];
    if([CTSession isContainInCurrentUserOrder:selectedProduct]) {
        [CTSession removeProduct:selectedProduct];
    } else {
        [CTSession addProduct:selectedProduct];
    }
    
    [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
 //   self.category = (CTCategory *)self.dataArray[indexPath.row];
//    [self performSegueWithIdentifier:[CTProductsTableViewController segueIdentifier] sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTProductTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTProductTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTProductTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTProductTableViewCell.cellIdentifier];
    }
    
    CTProduct *product = (CTProduct *)self.dataArray[indexPath.row];
    cell.name.text = product.name;
    cell.weight.text = product.productWeight;
    cell.price.text = [NSString stringWithFormat:@"%.1f", product.price];//((CTTeam *)self.dataArray[indexPath.row]).name;
    NSURL *url = [NSURL URLWithString:product.imageUrl];
    [cell.image setImageWithURL:url placeholderImage:[UIImage imageNamed:@"userIcon"]];
    cell.checkboxButton.selected = [CTSession isContainInCurrentUserOrder:product];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
