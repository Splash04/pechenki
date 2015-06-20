//
//  CTTeamDetailsViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTTeamDetailsViewController.h"
#import "CTTwitterTableViewCell.h"

@interface CTTeamDetailsViewController ()

@property (strong, nonatomic) NSMutableArray *dataArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIImageView *btnPeople;
@property (strong, nonatomic) IBOutlet UIImageView *btnHistory;
@property (strong, nonatomic) IBOutlet UIImageView *btnPayment;
@property (strong, nonatomic) IBOutlet UIImageView *btnHistoryPayment;
@property (strong, nonatomic) IBOutlet UIImageView *btnOrder;
@property (strong, nonatomic) IBOutlet UIImageView *btnMessages;

@end

@implementation CTTeamDetailsViewController

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
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
//    UIView *selectionColor = [[UIView alloc] init];
//    selectionColor.backgroundColor = CUSTOM_RED_COLOR_WITH_ALPHA;
//    cell.selectedBackgroundView = selectionColor;
    
    //self.btnPeople.backgroundColor = [UIColor blueColor];
    
    self.dataArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning !!!!
    return 10;
    //return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTTwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTTwitterTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTTwitterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTTwitterTableViewCell.cellIdentifier];
    }
    
#warning !!!!
    cell.twitterText.text = @"twit";//((CTTeam *)self.dataArray[indexPath.row]).name;
    //cell.twitterImage.text = ((CTTeam *)self.dataArray[indexPath.row]).info;
    
    return cell;

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
