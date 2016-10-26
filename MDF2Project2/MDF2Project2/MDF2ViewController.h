//
//  MDF2ViewController.h
//  MDF2Project2
//
//  Created by Brenna Pavlinchak on 4/9/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDF2ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource> 
{
    IBOutlet UICollectionView *myCollectionView;
    NSArray *twitterFriendList;
    NSArray *friendList;
    NSMutableArray *twitFriendArray;
    NSDictionary *twitterDictonary;
    
    UIImage *image;
    
    UIAlertView *alert;
}
@end
