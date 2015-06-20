//
//  CTTeamTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTeamTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *photo;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UILabel *info;

+ (NSString *)cellIdentifier;

@end
