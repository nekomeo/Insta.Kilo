//
//  ViewController.m
//  Insta.Kilo
//
//  Created by Elle Ti on 2017-08-09.
//  Copyright © 2017 Elle Ti. All rights reserved.
//

#import "ViewController.h"
#import "InstaPhotos.h"
#import "PhotoCollectionViewCell.h"
#import "HeaderCollectionReusableView.h"

@interface ViewController ()
@property (nonatomic) NSArray *photoImagesArray;
@property (nonatomic) NSDictionary *photosBySubject;
@property (nonatomic) NSArray *subjects;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self photoImages];
}

- (void)photoImages
{
    InstaPhotos *image1 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3004"]];
    InstaPhotos *image2 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3014"]];
    InstaPhotos *image3 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3053"]];
    InstaPhotos *image4 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3057"]];
    InstaPhotos *image5 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3085"]];
    InstaPhotos *image6 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3121"]];
    InstaPhotos *image7 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3923"]];
    InstaPhotos *image8 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_3954"]];
    InstaPhotos *image9 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_4012"]];
    InstaPhotos *image10 = [[InstaPhotos alloc] initWithName:[UIImage imageNamed:@"IMG_4014"]];
    
    self.photoImagesArray = @[image1, image2, image3, image4, image5, image6, image7, image8, image9, image10];
    
    self.photosBySubject = @{@"General":@[image1, image2, image4, image5, image7, image10],
                             @"Food":@[image3, image6, image8, image9]};
    
    self.subjects = @[@"General", @"Food"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.subjects.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSString *key = self.subjects[section];
    NSArray *subjectArray = [self.photosBySubject objectForKey:key];
    return subjectArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    // do self.collectionView if connecting CollectionView from storyboard and made a property
    
    NSString *key = self.subjects[indexPath.section];
    NSArray *subjectArray = [self.photosBySubject objectForKey:key];
    
    InstaPhotos *photos = subjectArray[indexPath.row];
    [cell configureCellWithPhoto:photos];
    
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        headerView.sectionHeaderLabel.text = self.subjects[indexPath.section];
        return headerView;
    }
    return nil;
}


@end
