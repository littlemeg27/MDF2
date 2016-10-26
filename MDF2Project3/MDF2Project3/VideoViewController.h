//
//  VideoViewController.h
//  MDF2Project3
//
//  Created by William Pavlinchak on 4/18/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController
{
    IBOutlet UIView *videoPlayer;
    
    UIAlertView *videoAlert;
}

@property (strong, nonatomic) NSString *addVideo;

@end
