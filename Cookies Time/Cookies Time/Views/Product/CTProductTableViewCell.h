//
//  CTProductTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTProductTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *price;
@property (strong, nonatomic) IBOutlet UILabel *weight;
@property (weak, nonatomic) IBOutlet UIButton *checkboxButton;

+ (NSString *)cellIdentifier;

@end
