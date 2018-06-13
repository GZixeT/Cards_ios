//
//  GameViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCMode.h"
#import "Cards.h"
#import "CTimer.h"
//for test branch to merge
//for commit of tower
@protocol VCModeDelegate;
@interface VCGame: UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *cView;
@property(strong, nonatomic) Cards *game; 
@property (weak ,nonatomic) id <VCModeDelegate> delegate;
@property CTimer *timer;
@end

