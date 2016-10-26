//
//  PhotoViewController.h
//  MDF2Project3
//
//  Created by Brenna Pavlinchak on 4/18/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoViewController : UIViewController
{
    IBOutlet UIImageView *imageUnedited;
    IBOutlet UIImageView *imageEdited;
    UIAlertView *photoAlert;
}

@property (strong, nonatomic) UIImage *addImage;
@property (strong, nonatomic) UIImage *addEditedImage;

@end
