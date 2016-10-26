//
//  CustomTableViewCell.m
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)refreshCell:(NSString*)twitName twitTime:(NSString*)twitTime twitPic:(UIImage*)twitPic
{
    _twitNamed.text = twitName;
    _twitTimed.text = twitTime;
}
@end
