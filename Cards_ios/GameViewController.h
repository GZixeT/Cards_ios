//
//  GameViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cards.h"
#import "CustomCollectionView.h"
//for test branch to merge
//for commit of tower
@interface GameViewController : UIViewController{
    CGFloat _screenWidth;
    CGFloat _screenHeight;
    CGFloat _cardWidth;
    CGFloat _cardHeight;
}
@property (weak, nonatomic) IBOutlet CustomCollectionView *controllerView;
@end
