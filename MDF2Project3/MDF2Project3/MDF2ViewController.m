//
//  MDF2ViewController.m
//  MDF2Project3
//
//  Created by William Pavlinchak on 4/17/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "MDF2ViewController.h"
#import "PhotoViewController.h"
#import "VideoViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>

@interface MDF2ViewController ()

@end

@implementation MDF2ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated
{
    if (uneditedImage != nil) //Bring up the photo view
    {
        [self performSegueWithIdentifier: @"photo" sender: self];
    }
    else if (video != nil) //Bring up the video view
    {
        [self performSegueWithIdentifier: @"video" sender: self];
    }
    else //Dont do anything
    {
        NSLog(@"It didnt do anything");
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    
    UIImage *selected = [info objectForKey:@"UIImagePickerControllerOriginalImage"]; //Bring in original image
    
        if (selected != nil)
        {
            uneditedImage = selected;
            NSLog(@"%@", uneditedImage);
        }
    
    UIImage *edited = [info objectForKey:@"UIImagePickerControllerEditedImage"]; //Bring in the edited image
    
        if (edited != nil)
        {
            editedImage = edited;
            NSLog(@"%@", editedImage);
        }
    
    NSURL *videoUrl = [info valueForKey:UIImagePickerControllerMediaURL]; //Bring in the video
    
        if (videoUrl != nil)
        {
            video = [videoUrl path];
            NSLog(@"%@", video);
        }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


-(IBAction)onClick:(UIButton*)button
{
    if(button.tag == 0)
    {
        UIImagePickerController * pickCamera = [[UIImagePickerController alloc] init]; //This is for the camera button
        
        pickCamera.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickCamera.delegate = self;
        pickCamera.allowsEditing = true;
        
        [self presentViewController:pickCamera animated:YES completion:NULL];
    }
    
    else if(button.tag == 1)
    {
        UIImagePickerController * pickVideo = [[UIImagePickerController alloc] init]; //This is for the video button
        
        pickVideo.sourceType = UIImagePickerControllerSourceTypeCamera;
        pickVideo.delegate = self;
        pickVideo.allowsEditing = false;
        pickVideo.videoQuality = UIImagePickerControllerQualityTypeHigh;
        pickVideo.mediaTypes = [NSArray arrayWithObjects:(NSString *) kUTTypeMovie, nil];
        
        [self presentViewController:pickVideo animated:YES completion:NULL];
    }
    
    else if(button.tag == 2)
    {
        UIImagePickerController * pickAlbum = [[UIImagePickerController alloc] init]; //This is for the gallery button
        
        pickAlbum.delegate = self;
        pickAlbum.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        pickAlbum.mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        pickAlbum.delegate = self;
        pickAlbum.allowsEditing = false;
        
        [self presentViewController:pickAlbum animated:YES completion:NULL];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"photo"]) //Photo segue
    {
        PhotoViewController *photoView = segue.destinationViewController;
        photoView.addImage = uneditedImage;
        photoView.addEditedImage = editedImage;
        uneditedImage = nil;
        editedImage = nil;
    }
    else if ([segue.identifier isEqualToString:@"video"]) //Video segue
    {
        VideoViewController *videoView = segue.destinationViewController;
        videoView.addVideo = video;
        video = nil;
    }
}


@end
