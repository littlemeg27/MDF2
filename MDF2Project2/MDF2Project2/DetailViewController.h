//
//  DetailViewController.h
//  MDF2Project2
//
//  Created by Mary Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *handleLabel;
    IBOutlet UIImageView *userImageView;
}

@property (strong, nonatomic) NSString *userHandle;
@property (strong, nonatomic) UIImage *userImage;
@property (strong, nonatomic) NSDictionary *twitFriendDict;

@end
