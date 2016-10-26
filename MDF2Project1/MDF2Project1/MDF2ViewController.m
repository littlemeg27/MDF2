//
//  MDF2ViewController.m
//  MDF2Project1
//
//  Created by Brenna Pavlinchak on 4/2/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF2ViewController.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "DetailViewController.h"
#import "ProfileViewController.h"
#import "CustomTableViewCell.h"


@interface MDF2ViewController ()

@end

@implementation MDF2ViewController

- (void)viewDidLoad
{
    UINib *customCellNib = [UINib nibWithNibName:@"CustomCellView" bundle:nil];
    
        if(customCellNib !=nil)
        {
            [myTableView registerNib:customCellNib forCellReuseIdentifier:@"customTwitterCell"];
        }
    
    static dispatch_once_t onceToken; //The call for the first set of tweets
    dispatch_once(&onceToken,
                  
                  ^{
                      [self getTweets];
                   });
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{

    [myTableView reloadData]; //Reset the cells
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)getTweets //The call to get the tweets
{
    ACAccountStore *twitterAccountStore = [[ACAccountStore alloc] init];
    
    if (twitterAccountStore != nil)
    {

        ACAccountType *twitterAccountType =[twitterAccountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        
        if (twitterAccountType != nil)
        {
           alert = [[UIAlertView alloc] initWithTitle:@"Loading Tweets" //Pops up a UI alert saying that the tweets are loading
                                               message:@"\n"
                                              delegate:self
                                     cancelButtonTitle:nil
                                     otherButtonTitles:nil];
            [alert show];
            
            [twitterAccountStore requestAccessToAccountsWithType:twitterAccountType options:nil completion:^(BOOL granted, NSError *error)
            {
                 NSArray *twitterAccount = [twitterAccountStore accountsWithAccountType:twitterAccountType];
                
                 if(twitterAccount != nil)
                 {
                        ACAccount *currentAccount = [twitterAccount objectAtIndex:0];
                        //NSLog(@"%@", [twitterAccount description]);
                     
                        if(currentAccount != nil)
                        {
                            NSString *userString = @"https://api.twitter.com/1.1/statuses/user_timeline.json?count=20";
                         
                            SLRequest *theRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userString] parameters:nil];
                            
                                if (theRequest != nil)
                                {
                                    [theRequest setAccount:currentAccount];
                             
                                        [theRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                                        {
                                             NSInteger responseCode = [urlResponse statusCode];
                                            
                                                if (responseCode == 200)
                                                {
                                                        theTwitterFeed = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                                        if (theTwitterFeed != nil)
                                                        {
                                                            //NSLog(@"%@", [theTwitterFeed description]);
                                                            //NSLog(@"%@", [[theTwitterFeed objectAtIndex:0] description]);
                                                            [myTableView reloadData];
                                                        }
                                                }
                                        }];
                                }
                        }

                  }
                 
                  else
                  {
                      NSLog(@"The user did not grant access yet!"); //The user didnt get access
                  }

            }];
        }
    } //End of call for the individual user twitter
    
    
    if (twitterAccountStore != nil) //Start of the user info
    {
        
        ACAccountType *twitterAccountType =[twitterAccountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        
        if (twitterAccountType != nil)
        {
            [twitterAccountStore requestAccessToAccountsWithType:twitterAccountType options:nil completion:^(BOOL granted, NSError *error)
             {
                 NSArray *twitterAccount = [twitterAccountStore accountsWithAccountType:twitterAccountType];
                 
                 if(twitterAccount != nil)
                 {
                     ACAccount *currentAccount = [twitterAccount objectAtIndex:0];
                     //NSLog(@"%@", [twitterAccount description]);
                     
                     if(currentAccount != nil)
                     {
                         NSString *userString = @"https://api.twitter.com/1.1/users/show.json?screen_name=ravenmargret";
                         
                         SLRequest *theRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userString] parameters:nil];
                         
                         if (theRequest != nil)
                         {
                             [theRequest setAccount:currentAccount];
                             
                             [theRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                              {
                                  NSInteger responseCode = [urlResponse statusCode];
                                  
                                  if (responseCode == 200)
                                  {
                                      theUserInfo = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                      if (theUserInfo != nil)
                                      {
                                          [myTableView reloadData];
                                          NSLog(@"%@", [theUserInfo description]);
                                      }
                                  }
                              }];
                         }
                     }
                     
                 }
                 
                 else
                 {
                     NSLog(@"The user did not grant access yet!"); //The user didnt get access
                 }
                 
             }];
        }
    } //End of call for user info.
    
    
    
    
}


- (NSInteger)tableView:(UITableView*)tableView numberOfRowsInSection:(NSInteger)section //Set the number of cells in the view depnding on how many in the twitter feed
{
    if (theTwitterFeed != nil)
    {
        return [theTwitterFeed count]; //This is returning the number of twitter feed posts.
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"feed: %@", [theTwitterFeed objectAtIndex:0]);

    CustomTableViewCell *customCell = [myTableView dequeueReusableCellWithIdentifier:@"myTwitterCell"];
    if (customCell != nil)
    {
        NSDictionary *twitterDictonary = [theTwitterFeed objectAtIndex:indexPath.row];
        NSDictionary *userDictonary = [twitterDictonary objectForKey:@"user"];
        //NSLog(@"user: %@", [[theTwitterFeed objectAtIndex:indexPath.row]valueForKey:@"text"]);
        
        NSData *image = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:[userDictonary valueForKey:@"profile_image_url_https"]]];
        
        customCell.twitNamed.text = [[theTwitterFeed objectAtIndex:indexPath.row]valueForKey:@"text"];
        customCell.twitTimed.text = [twitterDictonary valueForKey:@"created_at"];
        customCell.twitPic.image = [[UIImage alloc] initWithData:image];
        
        [alert dismissWithClickedButtonIndex:0 animated:YES];
    }
    return customCell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *twitterDictonary = [theTwitterFeed objectAtIndex:indexPath.row];
    NSDictionary *userDictonary = [twitterDictonary objectForKey:@"user"];
    
    twitterText = [twitterDictonary valueForKey:@"text"];
    twitterDate = [twitterDictonary valueForKey:@"created_at"];
    twitterUser = [userDictonary valueForKey:@"screen_name"];
    
    
    //twitterImage = [[UIImage alloc] initWithData:image];
    
    //[self performSegueWithIdentifier: @"detail" sender: self];
}


-(IBAction)poster:(id)sender //This is how we post new tweets
{
    SLComposeViewController *composeTweet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    if (composeTweet != nil)
    {
        [composeTweet setInitialText:@"Posted From"];
        
        [self presentViewController:composeTweet animated:true completion:nil];
        
    }
}


-(IBAction)onRefresh:(id)sender //Refresh the twitter feed
{
    [self getTweets];
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    UITableViewCell *cell = (UITableViewCell*)sender;
    NSIndexPath *indexPath = [myTableView indexPathForCell:cell];
    
    if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailViewController *detailView = segue.destinationViewController;
        detailView.textTweet = [[theTwitterFeed objectAtIndex:indexPath.row]valueForKey:@"text"]; //This is for the tweet
        detailView.dateTweet = [[theTwitterFeed objectAtIndex:indexPath.row]valueForKey:@"created_at"]; //This is for the date/time
        
        NSDictionary *userInfo = [[theTwitterFeed objectAtIndex:indexPath.row] objectForKey:@"user"];
        detailView.userTweet = [userInfo valueForKey:@"screen_name"]; //This is for the username
        
        
    }
    
    else if ([segue.identifier isEqualToString:@"profile"])
    {
        ProfileViewController *profileView = segue.destinationViewController;
        profileView.profileName = [theUserInfo valueForKey:@"name"];
        profileView.profileUser = [theUserInfo valueForKey:@"screen_name"];
        profileView.profileDetail = [theUserInfo valueForKey:@"description"];
        profileView.profileFriends= [NSString stringWithFormat:@"%@", [theUserInfo valueForKey:@"followers_count"]];
        profileView.profileFriends= [NSString stringWithFormat:@"%@", [theUserInfo valueForKey:@"friends_count"]];
    }
    
    
}


@end
