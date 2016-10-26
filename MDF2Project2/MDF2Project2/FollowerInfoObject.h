//
//  FollowerInfoObject.h
//  MDF2Project2
//
//  Created by Mary Pavlinchak on 4/14/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FollowerInfoObject : NSObject
{
    
NSString *followerHandle;
UIImage *followerImage;
    
}

-(id)initWithName:(NSString*)userName userImage:(UIImage *)userImage;

@property(nonatomic, strong)NSString *followerHandle;
@property(nonatomic, strong)UIImage *followerImage;

@end
