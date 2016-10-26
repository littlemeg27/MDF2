//
//  ProfileViewController.m
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController

@synthesize profileName;
@synthesize profileUser;
@synthesize profileDetail;
@synthesize profileFollowers;
@synthesize profileFriends;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    NSLog(@"profile name: %@", profileName);
    nameLabel.text = profileName;
    
    NSLog(@"profile user: %@", profileUser);
    userLabel.text = profileUser;
    
    NSLog(@"profile detail: %@", profileDetail);
    detailsLabel.text = profileDetail;
    
    NSLog(@"profile followers: %@", profileFollowers);
    followersLabel.text = profileFollowers;
    
    NSLog(@"profile friends: %@", profileFriends);
    friendLabel.text = profileFriends;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)updateUILabel
{
    nameLabel.text = profileName;
    userLabel.text = profileUser;
    detailsLabel.text = profileDetail;
    followersLabel.text = profileFollowers;
    friendLabel.text = profileFriends;
}

@end
