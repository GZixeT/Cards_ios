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
-(void)horizontalCenteForButtons{
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat screenWidth=CGRectGetWidth(screen);
    [_nGameButton setHorizontalCenterForScreen:screenWidth];
    [_continueButton setHorizontalCenterForScreen:screenWidth];
    [_exitButton setHorizontalCenterForScreen:screenWidth];
    [_easyModeButon setHorizontalCenterForScreen:screenWidth];
    [_middleModeButton setHorizontalCenterForScreen:screenWidth];
    [_hardModeButon setHorizontalCenterForScreen:screenWidth];
}
- (void) getVerticalPercentForButtons{
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat screenHeight=CGRectGetHeight(screen);
    [_nGameButton verticalPercent:screenHeight];
    [_continueButton verticalPercent:screenHeight];
    [_exitButton verticalPercent:screenHeight];
    [_easyModeButon verticalPercent:screenHeight];
    [_middleModeButton verticalPercent:screenHeight];
    [_hardModeButon verticalPercent:screenHeight];
}
- (void) setNewVerticalPositionForScreen{
    CGRect screen=[[UIScreen mainScreen]bounds];
    CGFloat screenHeight=CGRectGetHeight(screen);
    [_nGameButton setVerticalForScreen:screenHeight];
    [_continueButton setVerticalForScreen:screenHeight];
    [_exitButton setVerticalForScreen:screenHeight];
    [_easyModeButon setVerticalForScreen:screenHeight];
    [_middleModeButton setVerticalForScreen:screenHeight];
    [_hardModeButon setVerticalForScreen:screenHeight];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self horizontalCenteForButtons];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self getVerticalPercentForButtons];
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [self horizontalCenteForButtons];
        [self setNewVerticalPositionForScreen];
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ExitButtonClick:(id)sender {
    exit(0);
}
- (IBAction)EasyModeButtonClick:(id)sender {
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:EASY_MODE_CARD_NUMBER];
}
- (IBAction)MiddleModeButtonClick:(id)sender {
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:MIDDLE_MODE_CARD_NUMBER];
}
- (IBAction)HardModeButtonClick:(id)sender {
    cards=[Cards sharedInstance:HEIGHT_CARDS CardDeckNumber:HARD_MODE_CARD_NUMBER];
}
- (IBAction)ContinueButtonClick:(id)sender {
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *continueController;
     continueController=(ViewController*)[storyboard instantiateViewControllerWithIdentifier:@"Game"];
    if(continueController)
        [self.navigationController pushViewController:continueController animated:YES];
}


@end
