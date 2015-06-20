//
//  CTTeamsViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTTeamsViewController.h"
#import "CTTeamTableViewCell.h"
#import "CTTeam.h"
#import "CTDataManager.h"
#import "UIRefreshControl+AFNetworking.h"
#import "UIAlertView+AFNetworking.h"
#import "CTNewTeamViewController.h"
#import "CTTeamDetailsViewController.h"

@interface CTTeamsViewController ()

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) CTTeam *currentTeam;

@end

@implementation CTTeamsViewController

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
    
    NSURLSessionTask *task = [CTDataManager getAllTeamsWithResultBlock:^(NSArray *teams, NSError *error) {
        if (!error) {
            self.dataArray = [teams mutableCopy];
            [self.tableView reloadData];
        }
        else {
            NSLog(@"Error: %@", error);
        }

    }];
    
    [UIAlertView showAlertViewForTaskWithErrorOnCompletion:task delegate:nil];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createTeamTap:(id)sender {
    [self performSegueWithIdentifier:[CTNewTeamViewController segueIdentifier] sender: self];
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
    
    cell.name.text = ((CTTeam *)self.dataArray[indexPath.row]).name;
    cell.info.text = ((CTTeam *)self.dataArray[indexPath.row]).info;
    //cell.photo.image = ;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.currentTeam = self.dataArray[indexPath.row];
    [self performSegueWithIdentifier:[CTTeamDetailsViewController segueIdentifier] sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:[CTTeamDetailsViewController segueIdentifier]]) {
        CTTeamDetailsViewController *teamDetailViewController = [segue destinationViewController];
        teamDetailViewController.team = self.currentTeam;
    }

}

@end
