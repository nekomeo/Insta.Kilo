//
//  PhotoCollectionViewCell.m
//  Insta.Kilo
//
//  Created by Elle Ti on 2017-08-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "PhotoCollectionViewCell.h"

@implementation PhotoCollectionViewCell

- (void)configureCellWithPhoto:(InstaPhotos *)instaPhoto
{
    self.photoImageView.image = instaPhoto.photoName;
}

@end
