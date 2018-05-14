//
//  ViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardsUIButton.h"
#import "Cards.h"
typedef enum{
    GameModeSwitcherNo,
    GameModeSwitcherEasy,
    GameModeSwitcherMiddle,
    GameModeSwitcherHard
}GameModeSwitcher;

static GameModeSwitcher _gameSwitcher;

@interface ViewController : UIViewController{
    CGFloat _screenWidth;
    CGFloat _screenHeight;
    Cards *cards;
}

@property (weak, nonatomic) IBOutlet CardsUIButton *exitButton;
@property (weak, nonatomic) IBOutlet CardsUIButton *continueButton;
@property (weak, nonatomic) IBOutlet CardsUIButton *nGameButton;
@property (weak, nonatomic) IBOutlet UIButton *easyModeButon;
@property (weak, nonatomic) IBOutlet UIButton *middleModeButton;
@property (weak, nonatomic) IBOutlet UIButton *hardModeButon;

@end

