//
//  DetailViewController.h
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
{
    IBOutlet UILabel *tweetLabel;
    IBOutlet UILabel *dateLabel;
    IBOutlet UILabel *userLabel;
    IBOutlet UIImage *picLabel;
}

@property (strong, nonatomic) NSString *textTweet;
@property (strong, nonatomic) NSString *dateTweet;
@property (strong, nonatomic) NSString *userTweet;


-(IBAction)backButton:(id)sender;

@end
