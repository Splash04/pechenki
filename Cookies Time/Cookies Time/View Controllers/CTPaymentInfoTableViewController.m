//
//  CTPaymentInfoTableViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTPaymentInfoTableViewController.h"
#import "CTPaymentInfoTableViewCell.h"

@interface CTPaymentInfoTableViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation CTPaymentInfoTableViewController

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
    
#warning init
    self.dataArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.dataArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CTPaymentInfoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTPaymentInfoTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTPaymentInfoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTPaymentInfoTableViewCell.cellIdentifier];
    }
    
#warning !!!!
    cell.date.text = [NSString stringWithFormat:@"Дата: %@", @"1111"];
    cell.sum.text = [NSString stringWithFormat:@"Сумма: %@", @"1111"];
    cell.who.text = @"who";
    cell.who.text = @"whom";
    
    
    return cell;
}


@end
