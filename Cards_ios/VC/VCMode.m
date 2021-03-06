//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 18.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#define CORNER_RADIUS 10

#import "VCMode.h"
#import "Cards.h"
#import "VCGame.h"
#import "VCMain.h"

@interface VCMode ()
@end

@implementation VCMode

- (void)viewDidLoad{
    [super viewDidLoad];
    self.easyMode.layer.cornerRadius=CORNER_RADIUS;
    self.middleMode.layer.cornerRadius=CORNER_RADIUS;
    self.hardMode.layer.cornerRadius=CORNER_RADIUS;
    if(self.navigationItem) {
        self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
    }
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (IBAction)EMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:GameModeEasy];
}
- (IBAction)MMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:GameModeMiddle];
}
- (IBAction)HMClick:(id)sender {
    self.game=[Cards createRandomDoubleDeck:GameModeHard];
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    VCGame *game = (VCGame *)segue.destinationViewController;
    [self.delegate isGameBeginingWithView:self.game gameView:game];
    game.game = self.game;
}
@end
