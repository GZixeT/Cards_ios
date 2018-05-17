//
//  GameViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//


#import "GameViewController.h"

@interface GameViewController ()
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Cards *cards=[Cards sharedInstance];
    CGRect screen=[[UIScreen mainScreen]bounds];
    _screenWidth=CGRectGetWidth(screen);
    _screenHeight=CGRectGetHeight(screen);
    _cardWidth=_screenWidth/[[Cards sharedInstance]height];
    _cardHeight=_screenHeight/([cards cardDeckNumber]/[cards height]);
    [_controllerView setCollectionViewToCenterScreen:_screenWidth];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
