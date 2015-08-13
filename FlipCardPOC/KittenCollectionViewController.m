//
//  KittenCollectionViewController.m
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/12/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import "KittenCollectionViewController.h"

@interface KittenCollectionViewController ()
@property (nonatomic, weak) NSArray *kittens;
@property (nonatomic, strong) UIView *kittenDetailView;
@property (nonatomic, strong) UIView *detailView;
@property (nonatomic) BOOL isKittenDetail;
@end

@implementation KittenCollectionViewController

- (void)viewDidLoad {
    self.kittens = [NSArray arrayWithObjects:@"kitten1.jpg", @"kitten2.jpg", @"kitten3.jpg", @"kitten4.jpg", nil];
    self.kittenDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 165, 165)];
    self.kittenDetailView.backgroundColor = [UIColor whiteColor];
}

//Kitten Collection View DataSource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.kittens.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    UIImageView *kittenImageView = (UIImageView *)[cell viewWithTag:100];
    kittenImageView.image = [UIImage imageNamed:[self.kittens objectAtIndex:indexPath.row]];
    
    return cell;
}

//Kitten Collection View Delegate Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

//    switch (indexPath.row) {
//        case 0:
//            self.kittenDetailViewController.kittenDetailLabel.text = @"KITTENS ARE AWESOME";
//            break;
//        case 1:
//            self.kittenDetailViewController.kittenDetailLabel.text = @"WOOT KITTENS";
//            break;
//        case 2:
//            self.kittenDetailViewController.kittenDetailLabel.text = @"KITTEH GO MEOW";
//            break;
//        case 3:
//            self.kittenDetailViewController.kittenDetailLabel.text = @"SUCK IT COLIN";
//            break;
//        default:
//            break;
//    }
    
    if (self.isKittenDetail == YES) {
        [UIView transitionFromView:self.kittenDetailView
                            toView:[self.collectionView cellForItemAtIndexPath:indexPath].contentView
                          duration:2
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        completion:^(BOOL finished) {
                            self.isKittenDetail = NO;
                            
                        }];
    } else {
        [UIView transitionFromView:[self.collectionView cellForItemAtIndexPath:indexPath].contentView
                        toView:self.kittenDetailView
                      duration:2
                       options:UIViewAnimationOptionTransitionFlipFromLeft
                    completion:^(BOOL finished) {
                        self.isKittenDetail = YES;
                    }];
    }
}


@end
