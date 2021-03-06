//
//  CTTeamDetailsViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTTeamDetailsViewController.h"
#import "CTTwitterTableViewCell.h"
#import "CTPeopleListViewController.h"
#import "CTPaymentInfoTableViewController.h"
#import "UIImageView+AFNetworking.h"
#import "CTCategoriesViewController.h"
#import "CTTwit.h"

@interface CTTeamDetailsViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *btnPeople;
@property (strong, nonatomic) IBOutlet UIImageView *btnHistory;
@property (strong, nonatomic) IBOutlet UIImageView *btnPayment;
@property (strong, nonatomic) IBOutlet UIImageView *btnHistoryPayment;
@property (strong, nonatomic) IBOutlet UIImageView *btnOrder;
@property (strong, nonatomic) IBOutlet UIImageView *btnMessages;
@property (weak, nonatomic) IBOutlet UIImageView *groupImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

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
    NSURL *url = [NSURL URLWithString:self.team.imagePath];
    [self.groupImageView setImageWithURL:url placeholderImage:[UIImage imageNamed:@"groupIcon"]];
    self.nameLabel.text = self.team.name;
    self.descriptionLabel.text = self.team.info;
    
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UIImage *icon = [UIImage imageNamed:@"iconListPeople"];
    self.btnPeople.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnPeople.tintColor = [UIColor blueColor];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPeople:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnPeople setUserInteractionEnabled:YES];
    [self.btnPeople addGestureRecognizer:singleTap];
    
    icon = [UIImage imageNamed:@"iconPayment"];
    self.btnPayment.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnPayment.tintColor = [UIColor blueColor];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPayment:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnPayment setUserInteractionEnabled:YES];
    [self.btnPayment addGestureRecognizer:singleTap];
    
    icon = [UIImage imageNamed:@"iconHistory"];
    self.btnHistory.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnHistory.tintColor = [UIColor blueColor];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHistory:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnHistory setUserInteractionEnabled:YES];
    [self.btnHistory addGestureRecognizer:singleTap];
    
    icon = [UIImage imageNamed:@"iconHistoryPayment"];
    self.btnHistoryPayment.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnHistoryPayment.tintColor = [UIColor blueColor];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHistoryPayment:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnHistoryPayment setUserInteractionEnabled:YES];
    [self.btnHistoryPayment addGestureRecognizer:singleTap];
    
    icon = [UIImage imageNamed:@"iconOrder"];
    self.btnOrder.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnOrder.tintColor = [UIColor blueColor];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOrder:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnOrder setUserInteractionEnabled:YES];
    [self.btnOrder addGestureRecognizer:singleTap];
    
    icon = [UIImage imageNamed:@"iconMessage"];
    self.btnMessages.image = [icon imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    self.btnMessages.tintColor = [UIColor blueColor];
    
    singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMessages:)];
    singleTap.numberOfTapsRequired = 1;
    [self.btnMessages setUserInteractionEnabled:YES];
    [self.btnMessages addGestureRecognizer:singleTap];
    
    self.dataArray = [[NSMutableArray alloc] init];
    [self.dataArray addObject:[[CTTwit alloc] initWithText:@"Мы заказали наш первый обед через Cookies Time! Ура!" withImagePath:@"http://cookingday.ru/wp-content/uploads/2013/12/23.jpg"]];
    [self.dataArray addObject:[[CTTwit alloc] initWithText:@"Отлично посидели с ребятами и посмеялись. С новыми силами в бой:)" withImagePath:@"http://www.mok.kz/upload/userfiles/images/%D1%81%D1%82%D1%83%D0%B4%D0%B5%D0%BD%D1%82%D0%B0%D0%BC/%D0%A1%D1%82%D0%BE%D0%BB%D0%BE%D0%B2%D0%B0%D1%8F.png"]];
    [self.dataArray addObject:[[CTTwit alloc] initWithText:@"Предлагаю организовать грибной день. Отписываем свои предложения." withImagePath:@"http://www.classicbritishmotorcycles.com/images/uploads/Social%20Logos/twitter1.jpg"]];
    [self.tableView reloadData];
}

- (void)tapPeople:(id)sender {
    [self performSegueWithIdentifier:[CTPeopleListViewController segueIdentifier] sender: self];
    NSLog(@"tapPeople");
}

- (void)tapPayment:(id)sender {
    [self performSegueWithIdentifier:[CTPaymentInfoTableViewController segueIdentifier] sender: self];
    NSLog(@"tapPayment");
}

- (void)tapHistory:(id)sender {
    NSLog(@"tapHistory");
}

- (void)tapHistoryPayment:(id)sender {
    NSLog(@"tapHistoryPayment");
}

- (void)tapOrder:(id)sender {
    [self performSegueWithIdentifier:@"CTCategoriesViewController" sender:self];
}

- (void)tapMessages:(id)sender {
    NSLog(@"tapMessages");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CTTwitterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CTTwitterTableViewCell.cellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[CTTwitterTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CTTwitterTableViewCell.cellIdentifier];
    }
    
#warning !!!!
    CTTwit *twit = (CTTwit *)self.dataArray[indexPath.row];
    cell.twitterText.text = twit.text;//((CTTeam *)self.dataArray[indexPath.row]).name;
    NSURL *url = [NSURL URLWithString:twit.imagePath];
    [cell.twitterImage setImageWithURL:url placeholderImage:[UIImage imageNamed:@"userIcon"]];
    //cell.twitterImage.text = ((CTTeam *)self.dataArray[indexPath.row]).info;
    
    return cell;

}
- (IBAction)joinToTeamTap:(id)sender {
    [CTDataManager joinTeam:self.team forUser:[CTSession sharedInstance].user withResultBlock:^(NSError *error) {
        if(error != nil) {
            NSLog(@"join team error: %@", error);
        } else {
            [self showAlert:@"Вы успешно добавлены в команду"];
        }
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:[CTPeopleListViewController segueIdentifier]]) {
        CTPeopleListViewController *peopleViewController = [segue destinationViewController];
        peopleViewController.team = self.team;
    }
    if ([[segue identifier] isEqualToString:[CTCategoriesViewController segueIdentifier]]) {
        CTCategoriesViewController *peopleViewController = [segue destinationViewController];
        peopleViewController.team = self.team;
        peopleViewController.restaurant = [CTRestaurant new];
        peopleViewController.restaurant.restaurantId = @"1";
    }
}

@end
