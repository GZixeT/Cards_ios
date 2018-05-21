//
//  ViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomButton.h"
#import "Cards.h"

// убрать синглтон - будет класс игры
// переделать класс карты, добавить игровую карту (состояние и ИзИквел)
// добвить колоду


@interface VCMain: UIViewController
@property (weak, nonatomic) IBOutlet UIButton *exitButton;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *nGameButton;
@end

