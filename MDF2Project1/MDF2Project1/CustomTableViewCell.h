//
//  CustomTableViewCell.h
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell


-(void)refreshCell:(NSString*)twitName twitTime:(NSString*)twitTime twitPic:(UIImage*)twitPic;

//@property (nonatomic, strong) NSString *twitNamed;
//@property (nonatomic, strong) NSString *twitTimed;
//@property (nonatomic, strong) UIImage *twitPic;
//@property (strong, nonatomic) IBOutlet UIView *twitNamed;
@property (strong, nonatomic) IBOutlet UILabel *twitTimed;
@property (strong, nonatomic) IBOutlet UILabel *twitNamed;
@property (strong, nonatomic) IBOutlet UIImageView *twitPic;

@end
