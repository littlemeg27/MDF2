//
//  MDF2ViewController.h
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14..
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDF2ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    IBOutlet UITableView *myTableView;
    NSArray *theTwitterFeed;
    NSDictionary *theUserInfo;
    
    NSString *twitterText;
    NSString *twitterDate;
    NSString *twitterUser;
    NSString *twitterName;
    NSString *twitterDetail;
    NSString *twitterFollowed;
    NSString *twitterFriends;
    
    UIImage *twitterImage;
    UIActivityIndicatorView *indicator;
    UIAlertView *alert;
}

-(IBAction)poster:(id)sender;
-(IBAction)onRefresh:(id)sender;

@end
