//
//  ViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCMode.h"
#import "Cards.h"

@interface VCMain: UIViewController <VCModeDelegate>
@property Cards *game;
@property (weak, nonatomic) IBOutlet UIButton *continueButton;
@property (weak, nonatomic) IBOutlet UIButton *nGameButton;
@end

