//
//  PhotoViewController.m
//  MDF2Project3
//
//  Created by William Pavlinchak on 4/18/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()

@end

@implementation PhotoViewController

@synthesize addImage;
@synthesize addEditedImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    imageUnedited.image = addImage;
    imageEdited.image = addEditedImage;
    
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
    
    if (button.tag == 0) //Save the image
    {
        UIImageWriteToSavedPhotosAlbum(addImage, self, nil, nil);
        UIImageWriteToSavedPhotosAlbum(addEditedImage, self, nil, nil);
        
        photoAlert = [[UIAlertView alloc] initWithTitle:@"Image saved" message:@"\n" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [photoAlert show]; //Alert that the photo has been saved
        [photoAlert dismissWithClickedButtonIndex:0 animated:YES];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
    else if (button.tag == 1) //Dont save anything
    {
        [self dismissViewControllerAnimated:YES completion:nil];
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
