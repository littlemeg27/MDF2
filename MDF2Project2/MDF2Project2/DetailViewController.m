//
//  DetailViewController.m
//  MDF2Project2
//
//  Created by Mary Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DetailViewController.h"
#import "MDF2ViewController.h"
#import "FollowerInfoObject.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize userHandle;
@synthesize userImage;
@synthesize twitFriendDict;

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
    NSLog(@"text: %@ Dictionary", [self.twitFriendDict description]);
    NSLog(@"Screen Name: %@", self.twitFriendDict[@"screen_name"]);
    NSLog(@"Image URL: %@", self.twitFriendDict[@"profile_image_url"]);
    
    userHandle = [twitFriendDict valueForKey:@"screen_name"];
    handleLabel.text = userHandle;
    
    NSString *imageURL = [twitFriendDict valueForKey:@"profile_image_url"]; //Turning into string
    NSData *image = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]; //getting data from URL
    userImage= [UIImage imageWithData:image]; //Turning data into a image
    userImageView.image = userImage; //Set the image to the detail view
    
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
    handleLabel.text = userHandle;
    userImageView.image = userImage;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
