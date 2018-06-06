//
//  ViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 18.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Cards.h"
#import "VCGame.h"

typedef enum
{
    GameModeEasy = 4,
    GameModeMiddle = 6,
    GameModeHard = 12
}GameMode;

@protocol VCModeDelegate;
@class VCGame;
@interface VCMode : UIViewController
@property Cards *game;
@property (weak, nonatomic) IBOutlet UIButton *easyMode;
@property (weak, nonatomic) IBOutlet UIButton *middleMode;
@property (weak, nonatomic) IBOutlet UIButton *hardMode;
@property (weak ,nonatomic) id <VCModeDelegate> delegate;
@end

@protocol VCModeDelegate <NSObject>
@optional
- (void) isGameBegining:(Cards*)game;
- (void) isGameBeginingWithView:(Cards*)game gameView:(VCGame*)view;
@end
