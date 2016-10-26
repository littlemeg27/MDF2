//
//  ProfileViewController.h
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController
{
    IBOutlet UILabel *nameLabel;
    IBOutlet UILabel *userLabel;
    IBOutlet UILabel *detailsLabel;
    IBOutlet UILabel *followersLabel;
    IBOutlet UILabel *friendLabel;
    IBOutlet UIImageView *profilePicture;
}

@property (strong, nonatomic) NSString *profileName;
@property (strong, nonatomic) NSString *profileUser;
@property (strong, nonatomic) NSString *profileDetail;
@property (strong, nonatomic) NSString *profileFollowers;
@property (strong, nonatomic) NSString *profileFriends;

@end
