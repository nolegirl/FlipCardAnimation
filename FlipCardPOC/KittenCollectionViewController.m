//
//  KittenCollectionViewController.m
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/12/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import "KittenCollectionViewController.h"
#import "KittenCollectionViewCell.h"

@interface KittenCollectionViewController ()
@property (nonatomic, weak) NSArray *kittens;
@end

@implementation KittenCollectionViewController

- (void)viewDidLoad {
    self.kittens = [NSArray arrayWithObjects:@"kitten1.jpg", @"kitten2.jpg", @"kitten3.jpg", @"kitten4.jpg", nil];
}

//Kitten Collection View DataSource Methods
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.kittens.count;
}

- (KittenCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    KittenCollectionViewCell *cell = (KittenCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:[self.kittens objectAtIndex:indexPath.row]];
    
    return cell;
}

//Kitten Collection View Delegate Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KittenCollectionViewCell *cell = (KittenCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
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
    
//Flip from imageview to detail view
    if (cell.flipped == NO) {
        [UIView transitionWithView:cell.contentView
                          duration:2.0
                           options:UIViewAnimationOptionTransitionFlipFromLeft
                        animations:^{
                            [cell.contentView addSubview:cell.detailView];
                        } completion:^(BOOL finished) {
                            cell.flipped = YES;
                        }];
    } else {
//Flip back from detail view to imageview
        [UIView transitionWithView:cell.contentView
                          duration:2.0
                           options:UIViewAnimationOptionTransitionFlipFromRight
                        animations:^{
                            [cell.contentView addSubview:cell.imageView];
                        } completion:^(BOOL finished) {
                            cell.flipped = NO;
                        }];
    }
}

@end
