//
//  VideoViewController.m
//  MDF2Project3
//
//  Created by Brenna Pavlinchak on 4/18/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController

@synthesize addVideo;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)onClick:(UIButton*)button
{
    
    if (button.tag == 0) //Save the video
    {
        UISaveVideoAtPathToSavedPhotosAlbum(addVideo, self, nil, nil);
        
        videoAlert = [[UIAlertView alloc]initWithTitle:@"The video was saved" message:@"\n" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [videoAlert show]; //Alert when the video is saved
        [videoAlert dismissWithClickedButtonIndex:0 animated:YES];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else if (button.tag == 1) //Close without saving anything
    {
        [self dismissViewControllerAnimated:YES completion:nil]; 
    }
    
    else //Dont do anything
    {
        NSLog(@"It didnt do anything");
    }    
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
