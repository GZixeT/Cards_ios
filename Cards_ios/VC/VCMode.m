//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 18.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define HEIGHT_CARDS 4
#define EASY_MODE_CARD_NUMBER 4
#define MIDDLE_MODE_CARD_NUMBER 6
#define HARD_MODE_CARD_NUMBER 12
#define CORNER_RADIUS 10

#import "Cards.h"
#import "VCMode.h"

@interface VCMode ()

@end

@implementation VCMode

- (void)viewDidLoad {
    [super viewDidLoad];
    self.easyMode.layer.cornerRadius=CORNER_RADIUS;
    self.middleMode.layer.cornerRadius=CORNER_RADIUS;
    self.hardMode.layer.cornerRadius=CORNER_RADIUS;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EMClick:(id)sender {
    [[Cards sharedInstance].map removeAllObjects];
    [[Cards sharedInstance].tableOfStates removeAllObjects];
    [[Cards sharedInstance]fillWithRandomCardsWithHeightAndNumber:HEIGHT_CARDS CardDeckNumber:EASY_MODE_CARD_NUMBER];
    [[Cards sharedInstance]initTableOfStates];
}
- (IBAction)MMClick:(id)sender {
    [[Cards sharedInstance].map removeAllObjects];
    [[Cards sharedInstance].tableOfStates removeAllObjects];
    [[Cards sharedInstance]fillWithRandomCardsWithHeightAndNumber:HEIGHT_CARDS CardDeckNumber:MIDDLE_MODE_CARD_NUMBER];
    [[Cards sharedInstance]initTableOfStates];
}
- (IBAction)HMClick:(id)sender {
    [[Cards sharedInstance].map removeAllObjects];
    [[Cards sharedInstance].tableOfStates removeAllObjects];
    [[Cards sharedInstance]fillWithRandomCardsWithHeightAndNumber:HEIGHT_CARDS CardDeckNumber:HARD_MODE_CARD_NUMBER];
    [[Cards sharedInstance]initTableOfStates];
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
