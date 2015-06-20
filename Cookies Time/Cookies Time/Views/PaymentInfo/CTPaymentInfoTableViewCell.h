//
//  CTPaymentInfoTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTPaymentInfoTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *date;
@property (strong, nonatomic) IBOutlet UILabel *sum;
@property (strong, nonatomic) IBOutlet UILabel *who;
@property (strong, nonatomic) IBOutlet UILabel *whom;

+ (NSString *)cellIdentifier;

@end
