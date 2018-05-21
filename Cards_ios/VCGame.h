//
//  GameViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cards.h"
//for test branch to merge
//for commit of tower
@interface VCGame: UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    CGFloat _screenWidth;
    CGFloat _screenHeight;
    CGFloat _cardWidth;
    CGFloat _cardHeight;
}
@property (strong, nonatomic) IBOutlet UICollectionView *cView;
@property (weak, nonatomic) IBOutlet UILabel *EGLabel;
@property(nonatomic) Cards *cardsManager;
@property NSTimer *timer;
@end
