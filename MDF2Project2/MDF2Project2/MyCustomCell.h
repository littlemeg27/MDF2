//
//  MyCustomCell.h
//  MDF2Project2
//
//  Created by Brenna Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UICollectionViewCell
{
    NSString *userInfo;
    UIImage *profileImage;
}

@property (nonatomic, strong)IBOutlet UILabel *cellLabel;
@property (nonatomic, strong)IBOutlet UIImageView *cellImage;

@property (nonatomic, strong)NSString *userInfo;
@property (nonatomic, strong)UIImage *profileImage;

-(void)resetWithLabel;

@end

