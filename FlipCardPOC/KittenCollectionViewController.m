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
@property (nonatomic) CGRect originalCellPosition;
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
        self.originalCellPosition = cell.frame;
        [UIView animateWithDuration:0.5f
                         animations:^{
                             
                             [UIView transitionWithView:cell.contentView
                                               duration:0.0f
                                                options:UIViewAnimationOptionTransitionFlipFromRight
                                             animations:^{
                                                 [cell.imageView removeFromSuperview];
                                                 [cell.contentView addSubview:cell.detailView];
                                                 [self.collectionView addSubview:cell];
                                                 cell.frame = CGRectMake(75, 50, self.collectionView.frame.size.width /1.6 , 300);
                                                 [self setDetailLabelForCell:cell atIndexPath:indexPath];
                                                 
                                                 cell.flipped = YES;
                                             }
                                             completion:nil];
                         }];
    } else {
        //Flip back from detail view to imageview
        [UIView animateWithDuration:0.5f
                         animations:^{
                             [UIView transitionWithView:cell.contentView
                                               duration:0.0f
                                                options:UIViewAnimationOptionTransitionFlipFromLeft
                                             animations:^{
                                                 cell.frame = self.originalCellPosition;
                                                 [cell.detailView removeFromSuperview];
                                                 [cell.contentView addSubview:cell.imageView];
                                                 cell.contentView.frame = CGRectMake(0, 0, 165, 165);
                                                 cell.imageView.frame = CGRectMake(0, 0, 165, 165);
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
            cell.detailLabel.text = @"KITTEH!";
            cell.emailLabel.text = @"This is where someone's email would go";
            cell.phoneLabel.text = @"Here's where some other crap about people that someone would want to know";
            break;
        default:
            break;
    }
}

@end
