//
//  KittenCollectionViewController.m
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/12/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import "KittenCollectionViewController.h"
#import "KittenCollectionViewCell.h"

@interface KittenCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
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
    cell.detailLabel.text = @"";
    cell.imageView.image = [UIImage imageNamed:[self.kittens objectAtIndex:indexPath.row]];
    
    return cell;
}

//Kitten Collection View Delegate Methods
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    KittenCollectionViewCell *cell = (KittenCollectionViewCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    
//Flip from imageview to detail view
    if (cell.flipped == NO) {
        [UIView animateWithDuration:2.0
                         animations:^{
                             
                             [UIView transitionWithView:cell.contentView
                                               duration:2.0
                                                options:UIViewAnimationOptionTransitionFlipFromRight
                                             animations:^{
                                                 [cell.contentView addSubview:cell.detailView];
                                                 cell.frame = CGRectMake(75, 50, self.collectionView.frame.size.width /1.6 , 300);
                                                 [self.collectionView bringSubviewToFront:cell.contentView];
                                                 [self setDetailLabelForCell:cell atIndexPath:indexPath];
                                                 
                                                 cell.flipped = YES;
                                             }
                                             completion:nil];
                         }];
    } else {
        //Flip back from detail view to imageview
        [UIView animateWithDuration:2.0
                         animations:^{
                             [UIView transitionWithView:cell.contentView
                                               duration:2.0
                                                options:UIViewAnimationOptionTransitionFlipFromLeft
                                             animations:^{
                                                 [cell.contentView addSubview:cell.imageView];
                                                 cell.frame = CGRectMake(200, 185, 165, 165);
                                                 cell.flipped = NO;
                                             }
                                             completion:nil];
                         }];
    }
}

- (void)setDetailLabelForCell:(KittenCollectionViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            cell.detailLabel.text = @"KITTENS ARE AWESOME";
            break;
        case 1:
            cell.detailLabel.text = @"WOOT KITTENS";
            break;
        case 2:
            cell.detailLabel.text = @"KITTEH GO MEOW";
            break;
        case 3:
            cell.detailLabel.text = @"SUCK IT COLIN";
            cell.emailLabel.text = @"This is where someone's email would go";
            cell.phoneLabel.text = @"Here's where some other crap about people that someone would want to know";
            break;
        default:
            break;
    }
}

@end
