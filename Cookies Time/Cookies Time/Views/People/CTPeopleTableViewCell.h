//
//  CTPeopleTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTPeopleTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *FIO;
@property (strong, nonatomic) IBOutlet UILabel *balance;
@property (strong, nonatomic) IBOutlet UIImageView *photo;

+ (NSString *)cellIdentifier;

@end
