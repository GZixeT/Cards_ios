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

#import "VCMode.h"
#import "Cards.h"
#import "VCGame.h"
#import "VCMain.h"

@interface VCMode ()
@end

@implementation VCMode

- (void)viewDidLoad {
    [super viewDidLoad];
    self.easyMode.layer.cornerRadius=CORNER_RADIUS;
    self.middleMode.layer.cornerRadius=CORNER_RADIUS;
    self.hardMode.layer.cornerRadius=CORNER_RADIUS;
//    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    VCGame *gameController = (VCGame*)[storyboard instantiateViewControllerWithIdentifier:@"Game"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)EMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:EASY_MODE_CARD_NUMBER];
    //gameController.game=self.game;
    
}
- (IBAction)MMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:MIDDLE_MODE_CARD_NUMBER];
    //gameController.game=self.game;
}
- (IBAction)HMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:HARD_MODE_CARD_NUMBER];
    //gameController.game=self.game;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [self.delegate isGameBegining:self.game];
    VCGame *game = (VCGame *)segue.destinationViewController;
    game.game = self.game;
}
@end
