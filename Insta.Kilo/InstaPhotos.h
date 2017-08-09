//
//  InstaPhotos.h
//  Insta.Kilo
//
//  Created by Elle Ti on 2017-08-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface InstaPhotos : NSObject
@property (nonatomic) UIImage *photoName;

- (instancetype)initWithName:(UIImage *)photoName;

@end
