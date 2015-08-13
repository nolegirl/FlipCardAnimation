//
//  KittenCollectionViewController.m
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/12/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import "KittenCollectionViewController.h"
#import "KittenDetailViewController.h"

@interface KittenCollectionViewController ()
@property (nonatomic, weak) NSArray *kittens;
@property (nonatomic, strong) KittenDetailViewController *detailViewController;
@end

@implementation KittenCollectionViewController

- (void)viewDidLoad {
    self.kittens = [NSArray arrayWithObjects:@"kitten1.jpg", @"kitten2.jpg", @"kitten3.jpg", @"kitten4.jpg", nil];
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
    UICollectionViewCell *cell = [self.collectionView cellForItemAtIndexPath:indexPath];
    
    self.detailViewController = (KittenDetailViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"KittenDetailViewController"];
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
//        [UIView transitionFromView:cell.contentView
//                            toView:self.detailViewController.view
//                          duration:2
//                           options:UIViewAnimationOptionTransitionFlipFromLeft
//                        completion:^(BOOL finished) {
//                            [self.collectionView.collectionViewLayout invalidateLayout];
//                            [UIView animateWithDuration:2.0
//                                             animations:^{
//                                                 cell.frame = CGRectMake(0, 50, self.collectionView.frame.size.width, 200);
//                                                 [cell bringSubviewToFront:self.view];
//                                             } completion:nil];
//                        }];
    [UIView animateWithDuration:2.0
                     animations:^{
                         [UIView transitionFromView:cell.contentView
                                             toView:self.detailViewController.view
                                           duration:2.0
                                            options:UIViewAnimationOptionTransitionFlipFromRight
                                         completion:nil];
                         cell.frame = CGRectMake(0, 50, self.collectionView.frame.size.width, 200);
                         [cell bringSubviewToFront:self.view];
                     } completion:nil];
    


}


@end
