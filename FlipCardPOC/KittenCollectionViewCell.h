//
//  KittenCollectionViewCell.h
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/13/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface KittenCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (nonatomic) BOOL flipped;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@end
