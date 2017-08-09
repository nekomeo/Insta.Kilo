//
//  PhotoCollectionViewCell.h
//  Insta.Kilo
//
//  Created by Elle Ti on 2017-08-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InstaPhotos.h"

@interface PhotoCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

- (void)configureCellWithPhoto:(InstaPhotos *)instaPhoto;

@end
