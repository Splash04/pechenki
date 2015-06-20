//
//  CTTeamsViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTTeamsViewController.h"
#import "CTTeamTableViewCell.h"

@interface CTTeamsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation CTTeamsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createTeamTap:(id)sender {
    
}

#pragma mark tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    CTTeamTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTTeamTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTTeamTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTTeamTableViewCell.cellIdentifier];
    }
    
    cell.name = nil;
    cell.info = nil;
    cell.photo = nil;
    
    return cell;
}




@end
