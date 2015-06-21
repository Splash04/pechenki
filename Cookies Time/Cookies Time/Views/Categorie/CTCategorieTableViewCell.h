//
//  CTCategorieTableViewCell.h
//  Cookies Time
//
//  Created by mac-207 on 6/21/15.
//  Copyright (c) 2015 Splash. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CTCategorieTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *categorie;

+ (NSString *)cellIdentifier;

@end
