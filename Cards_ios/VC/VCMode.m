//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 18.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define EASY_MODE_CARD_NUMBER 4
#define MIDDLE_MODE_CARD_NUMBER 6
#define HARD_MODE_CARD_NUMBER 12
#define CORNER_RADIUS 10

#import "Cards.h"
#import "VCMode.h"
#import "VCGame.h"

@interface VCMode ()
@property Cards *game;
@property VCGame *gameController;

@end

@implementation VCMode

- (void)viewDidLoad {
    [super viewDidLoad];
    self.easyMode.layer.cornerRadius=CORNER_RADIUS;
    self.middleMode.layer.cornerRadius=CORNER_RADIUS;
    self.hardMode.layer.cornerRadius=CORNER_RADIUS;
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    self.gameController = (VCGame*)[self.storyboard instantiateViewControllerWithIdentifier:@"Game"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EMClick:(id)sender {
    self.game=[Cards createRandomDeck:EASY_MODE_CARD_NUMBER];
    self.gameController.game=self.game;
    
}
- (IBAction)MMClick:(id)sender {
    self.game=[Cards createRandomDeck:MIDDLE_MODE_CARD_NUMBER];
    self.gameController.game=self.game;
}
- (IBAction)HMClick:(id)sender {
    self.game=[Cards createRandomDeck:HARD_MODE_CARD_NUMBER];
    self.gameController.game=self.game;
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
