//
//  MDF2ViewController.m
//  MDF2Project2
//
//  Created by Brenna Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF2ViewController.h"
#import "MyCustomCell.h"
#import "DetailViewController.h"
#import "FollowerInfoObject.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>

@interface MDF2ViewController ()

@end

@implementation MDF2ViewController

- (void)viewDidLoad
{
    static dispatch_once_t onceToken; //The call for the first set of tweets
    dispatch_once(&onceToken,
                  
                  ^{
                      [self getFriends];
                  });
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)getFriends //The call to get the tweets
{
    //alert = [[UIAlertView alloc] initWithTitle:@"Loading Twitter Friends" message:@"\n" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
    //[alert show]; //UI alert that the twitter friends are loading
    
    ACAccountStore *twitterAccountStore = [[ACAccountStore alloc] init];
    
    if (twitterAccountStore != nil)
    {
        
        ACAccountType *twitterAccountType =[twitterAccountStore accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
        
        if (twitterAccountType != nil)
        {
            [twitterAccountStore requestAccessToAccountsWithType:twitterAccountType options:nil completion:^(BOOL granted, NSError *error)
            {
                 if (!granted)
                 {
                   [alert dismissWithClickedButtonIndex:0 animated:YES];
                    alert = [[UIAlertView alloc]initWithTitle:@"Cannot Access Twitter" message:@"\n" delegate:self cancelButtonTitle:nil
                                            otherButtonTitles:@"Close", nil];
                   [alert show]; //Alert to see if the ACAccountStore gives access
                 }
                 
                 NSArray *twitterAccount = [twitterAccountStore accountsWithAccountType:twitterAccountType];
                 
                 if(twitterAccount != nil) //The twitter account granted access
                 {
                     ACAccount *currentAccount = [twitterAccount objectAtIndex:0];
                     //NSLog(@"%@", [twitterAccount description]);
                     
                     if(currentAccount != nil)
                     {
                         NSString *userFriendString = @"https://api.twitter.com/1.1/friends/list.json?cursor=-1&skip_status=true&include_user_entities=false"; //url to get twitter friends
                         
                         SLRequest *theRequest = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:[NSURL URLWithString:userFriendString] parameters:nil];
                         
                         if (theRequest != nil)
                         {
                             [theRequest setAccount:currentAccount];
                             
                             [theRequest performRequestWithHandler:^(NSData *responseData, NSHTTPURLResponse *urlResponse, NSError *error)
                              {
                                  NSInteger responseCode = [urlResponse statusCode];
                                  
                                  if (responseCode == 200)
                                  {
                                        twitterFriendList = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:nil];
                                        if (twitterFriendList != nil)
                                        {
                                            friendList = [twitterFriendList valueForKey:@"users"];
                                            
                                            twitFriendArray = [[NSMutableArray alloc]init]; //Create the array
                                            
                                            FollowerInfoObject *followerObject = [[FollowerInfoObject alloc]init];
                                            
                                            for(NSDictionary *followerDictonary in friendList) //Create the for loop
                                            {
                                                followerObject.followerHandle = [followerDictonary valueForKey:@"screen_name"]; //All the info for the twitter handle
                                                
                                                NSString *imageURL = [twitterDictonary valueForKey:@"profile_image_url"]; //Turning into string
                                                NSData *image = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]; //Getting data from URL
                                                UIImage *friendImage = [UIImage imageWithData:image]; //Turning data into a image
                                                followerObject.followerImage = friendImage;

                                                NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:followerObject.followerHandle, nil];
                                                
                                                [twitFriendArray addObject:dataArray];
                                            }
                                            
                                           
                                            [myCollectionView reloadData];
                                        }
                                  } //Check for response
                                  
                                  else if (responseCode != 200)
                                  {
                                      [alert dismissWithClickedButtonIndex:0 animated:YES]; //The alert of the response
                                      alert = [[UIAlertView alloc]initWithTitle:@"Cannot Connect To The Internet" message:@"\n" delegate:self cancelButtonTitle:nil
                                                                  otherButtonTitles:@"Close", nil];
                                      [alert show]; //What happens if the response doesnt go though
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
    } //End of call for the twitter friends
}
    

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section //First function that is required
{
    if (friendList != nil)
    {
        return [friendList count]; //This is returning the number of twitter feed posts.
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath //Second function that is required
{
    MyCustomCell *customCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCollection" forIndexPath:indexPath];
    
    if(customCell !=nil)
    {
        twitterDictonary = [friendList objectAtIndex:indexPath.item];
        
        NSString *imageURL = [twitterDictonary valueForKey:@"profile_image_url"]; //Turning into string
        NSData *image = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURL]]; //getting data from URL
        UIImage *friendImage = [UIImage imageWithData:image]; //Turning data into a image
        
        
        FollowerInfoObject *followerObject = [[FollowerInfoObject alloc]init]; //Declaire the object
    
        followerObject.followerHandle = [twitterDictonary valueForKey:@"screen_name"];
        followerObject.followerImage = [twitterDictonary valueForKey:@"profile_image_url"];
        //NSString *theImageURL = [twitterDictonary valueForKey:@"profile_image_url"];
        
        customCell.userInfo = [twitterDictonary valueForKey:@"screen_name"];
        customCell.profileImage = friendImage;
        
        [customCell resetWithLabel];
        
        return customCell;
    }

    return nil;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"detail"])
    {
        DetailViewController *detailView = segue.destinationViewController; //Send to detail view
        NSIndexPath *indexPath = [[myCollectionView indexPathsForSelectedItems]objectAtIndex:0];
        detailView.twitFriendDict = [ friendList objectAtIndex:indexPath.item]; //This is the array for the detail controller
        
    }
    
}

@end
