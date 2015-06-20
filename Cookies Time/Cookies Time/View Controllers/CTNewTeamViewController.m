//
//  CTNewTeamViewController.m
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import "CTNewTeamViewController.h"
#import "ActionSheetStringPicker.h"

@interface CTNewTeamViewController ()

@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UITextField *hashtag;
@property (strong, nonatomic) IBOutlet UITextView *desc;
@property (strong, nonatomic) IBOutlet UIPickerView *restaurantPicker;

@end

@implementation CTNewTeamViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)photoTap:(id)sender {
}

- (IBAction)galleryTap:(id)sender {
}

- (void)showCalendarPicker
{
    [ActionSheetStringPicker showPickerWithTitle:@"Select date"
                                datePickerMode:UIDatePickerModeDate
                                  selectedDate:self.date
                                     doneBlock:^(ActionSheetDatePicker *picker, id selectedDate, id origin) {
                                         self.date = [ISDataManager useSameTimeAsDate:self.date butOnADifferentDate:selectedDate];
                                         NSLog(@"Picker: %@", picker);
                                         NSLog(@"Selected date: %@", selectedDate);
                                         NSLog(@"Selected origin: %@", origin);
                                         [self.calendarIconView setSelected:NO];
                                     } cancelBlock:^(ActionSheetDatePicker *picker) {
                                         NSLog(@"Block Picker Canceled");
                                         [self.calendarIconView setSelected:NO];
                                     } origin:self];
}



@end
