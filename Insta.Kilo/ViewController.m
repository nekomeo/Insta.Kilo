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
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic) NSDictionary *photosBySubject;
@property (nonatomic) NSDictionary *photosByLocation;
@property (nonatomic) NSArray *subjects;
@property (nonatomic) NSArray *locations;
@property (nonatomic, assign) BOOL sortBySubject;
@property (weak, nonatomic) IBOutlet UISegmentedControl *sortSegmentedControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self photoImages];
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    self.sortBySubject = YES;
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
    
    self.photosBySubject = @{@"General":@[image1, image2, image4, image5, image7, image10],
                             @"Food":@[image3, image6, image8, image9]};
    
    self.photosByLocation = @{@"Vancouver":@[image1, image9, image10],
                              @"San Francisco":@[image2, image3, image4, image5, image6, image7],
                              @"Calgary":@[image8]};
    
    self.subjects = @[@"General", @"Food"];
    self.locations = @[@"Vancouver", @"San Francisco", @"Calgary"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (self.sortBySubject)
    {
        NSArray *subjectSection = [self.photosBySubject allKeys];
        return subjectSection.count;
    }
    else
    {
        NSArray *locationSection = [self.photosByLocation allKeys];
        return locationSection.count;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (self.sortBySubject)
    {
        NSString *key = self.subjects[section];
        NSArray *subjectArray = [self.photosBySubject objectForKey:key];
        return subjectArray.count;
    }
    else
    {
        NSString *key = self.locations[section];
        NSArray *locationArray = [self.photosByLocation objectForKey:key];
        return locationArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    PhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    // do self.collectionView if connecting CollectionView from storyboard and made a property
    
    if (self.sortSegmentedControl.selectedSegmentIndex == 0)
    {
        NSString *key = self.subjects[indexPath.section];
        NSArray *subjectArray = [self.photosBySubject objectForKey:key];
        
        InstaPhotos *photos = subjectArray[indexPath.row];
        [cell configureCellWithPhoto:photos];
    }
    else
    {
        NSString *key = self.locations[indexPath.section];
        NSArray *locationArray = [self.photosByLocation objectForKey:key];
        
        InstaPhotos *photos = locationArray[indexPath.row];
        [cell configureCellWithPhoto:photos];
    }
    
    return cell;    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
        
        if (self.sortBySubject)
        {
            NSString *subject = [self.subjects objectAtIndex:indexPath.section];
            headerView.sectionHeaderLabel.text = [NSString stringWithFormat:@"%@", subject];
//            headerView.sectionHeaderLabel.text = self.subjects[indexPath.section];
        }
        else
        {
            NSString *location = [self.locations objectAtIndex:indexPath.section];
            headerView.sectionHeaderLabel.text = [NSString stringWithFormat:@"%@", location];
        }
            
        return headerView;
    }
    return nil;    
}

- (IBAction)sortSegmentControl:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 0)
    {
        self.sortBySubject = YES;
    }
    else
    {
        self.sortBySubject = NO;
    }
    [self.collectionView reloadData];
}

@end
