//
//  ViewController.h
//  Cards_ios
//
//  Created by Георгий Зубков on 18.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cards.h"

@protocol VCModeDelegate;

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
@end
