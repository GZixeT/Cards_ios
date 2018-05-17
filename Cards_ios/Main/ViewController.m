//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define HEIGHT_CARDS 4
#define EASY_MODE_CARD_NUMBER 8
#define MIDDLE_MODE_CARD_NUMBER 12
#define HARD_MODE_CARD_NUMBER 24
#define CORNER_RADIUS 10

#import "ViewController.h"
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen=[[UIScreen mainScreen]bounds];
    _screenWidth=CGRectGetWidth(screen);
    _screenHeight=CGRectGetHeight(screen);
    [_nGameButton setHorizontalCenterForScreen:_screenWidth];
    [_continueButton setHorizontalCenterForScreen:_screenWidth];
    [_exitButton setHorizontalCenterForScreen:_screenWidth];
    [_easyModeButon setHorizontalCenterForScreen:_screenWidth];
    [_middleModeButton setHorizontalCenterForScreen:_screenWidth];
    [_hardModeButon setHorizontalCenterForScreen:_screenWidth];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ExitButtonClick:(id)sender {
    exit(0);
}
- (IBAction)EasyModeButtonClick:(id)sender {
    _gameSwitcher=GameModeSwitcherEasy;
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:EASY_MODE_CARD_NUMBER];
}
- (IBAction)MiddleModeButtonClick:(id)sender {
    _gameSwitcher=GameModeSwitcherMiddle;
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:MIDDLE_MODE_CARD_NUMBER];
}
- (IBAction)HardModeButtonClick:(id)sender {
    _gameSwitcher=GameModeSwitcherHard;
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:HARD_MODE_CARD_NUMBER];
}
- (IBAction)ContinueButtonClick:(id)sender {
    NSLog(@"%d",_gameSwitcher);
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *continueController;
    switch(_gameSwitcher){
        case GameModeSwitcherNo:
            break;
        case GameModeSwitcherEasy:
            continueController=(ViewController*)[storyboard instantiateViewControllerWithIdentifier:@"EasyMode"];
            break;
        case GameModeSwitcherMiddle:
            continueController=(ViewController*)[storyboard instantiateViewControllerWithIdentifier:@"MiddleMode"];
            break;
        case GameModeSwitcherHard:
            continueController=(ViewController*)[storyboard instantiateViewControllerWithIdentifier:@"HardMode"];
            break;
            default:
            NSLog(@"ContinueButtonClick Error!!!");
            break;
    }
    if(continueController)
        [self.navigationController pushViewController:continueController animated:YES];
}


@end
