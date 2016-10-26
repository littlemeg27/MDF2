//
//  FollowerInfoObject.m
//  MDF2Project2
//
//  Created by Mary Pavlinchak on 4/14/14.
//  Copyright (c) 2014 Brenna Pavlinchak. All rights reserved.
//

#import "FollowerInfoObject.h"

@implementation FollowerInfoObject

@synthesize followerHandle;
@synthesize followerImage;


-(id)initWithName:(NSString*)userName userImage:(UIImage *)userImage; //
{
    if ((self = [super init]))
    {
        followerHandle = userName;
        followerImage = userImage;
    }
    return self;
}
@end
