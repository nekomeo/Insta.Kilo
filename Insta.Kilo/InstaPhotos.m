//
//  InstaPhotos.m
//  Insta.Kilo
//
//  Created by Elle Ti on 2017-08-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "InstaPhotos.h"

@implementation InstaPhotos

- (instancetype)initWithName:(UIImage *)photoName
{
    if (self = [super init])
    {
        _photoName = photoName;
    }
    return self;
}

@end
