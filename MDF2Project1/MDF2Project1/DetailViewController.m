//
//  DetailViewController.m
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize textTweet;
@synthesize dateTweet;
@synthesize userTweet;

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
    
    //NSLog(@"text: %@", textTweet);
    tweetLabel.text = textTweet;
    
    //NSLog(@"text: %@", dateTweet);
    dateLabel.text = dateTweet;
    
    //NSLog(@"text: %@", userTweet);
    userLabel.text = userTweet;
    
    
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
    tweetLabel.text = textTweet;
    dateLabel.text = dateTweet;
    userLabel.text = userTweet;
}


-(IBAction)backButton:(id)sender
{
    [self dismissViewControllerAnimated:TRUE completion:nil];
}

@end
