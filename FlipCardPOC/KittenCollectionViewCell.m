//
//  KittenCollectionViewCell.m
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/13/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import "KittenCollectionViewCell.h"
#import "KittenCollectionViewController.h"

@interface KittenCollectionViewCell ()
@end

@implementation KittenCollectionViewCell

- (void)viewDidLoad {
    self.detailView.backgroundColor = [UIColor whiteColor];
    self.imageView.frame = CGRectMake(0, 0, 165, 165);
}



@end
