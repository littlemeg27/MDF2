//
//  MDF2ViewController.h
//  MDF2Project3
//
//  Created by William Pavlinchak on 4/17/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDF2ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
{
    UIImage *uneditedImage;
    UIImage *editedImage;
    NSString *video;
}
@end
