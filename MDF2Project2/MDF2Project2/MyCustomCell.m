//
//  MyCustomCell.m
//  MDF2Project2
//
//  Created by Brenna Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

@synthesize cellImage;
@synthesize cellLabel;
@synthesize userInfo;
@synthesize profileImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {

        // Initialization code
    }
    return self;
}

-(void)resetWithLabel
{
    cellLabel.text = userInfo;
    cellImage.image = profileImage;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
