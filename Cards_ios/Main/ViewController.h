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


@interface ViewController : UIViewController{
    Cards *cards;
}

@property (weak, nonatomic) IBOutlet CustomButton *exitButton;
@property (weak, nonatomic) IBOutlet CustomButton *continueButton;
@property (weak, nonatomic) IBOutlet CustomButton *nGameButton;
@property (weak, nonatomic) IBOutlet CustomButton *easyModeButon;
@property (weak, nonatomic) IBOutlet CustomButton *middleModeButton;
@property (weak, nonatomic) IBOutlet CustomButton *hardModeButon;

@end

