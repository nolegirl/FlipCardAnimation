//
//  KittenCollectionViewController.h
//  FlipCardPOC
//
//  Created by Mechelle Sieglitz on 8/12/15.
//  Copyright (c) 2015 Mechelle Sieglitz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KittenCollectionViewControllerDelegate <NSObject>


@end

@interface KittenCollectionViewController : UICollectionViewController

@property (nonatomic, weak) id<KittenCollectionViewControllerDelegate>delegate;

@end
