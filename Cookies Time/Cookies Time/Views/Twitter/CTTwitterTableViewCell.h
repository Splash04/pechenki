//
//  CTTwitterTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/20/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTTwitterTableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView *twitterImage;
@property (strong, nonatomic) IBOutlet UITextView *twitterText;

+ (NSString *)cellIdentifier;

@end
