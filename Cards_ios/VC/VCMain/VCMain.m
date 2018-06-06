//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#import "VCMain.h"
#import "VCGame.h"
#import "VCMode.h"
#define CORNER_RADIUS 10

@interface VCMain()
@end

@implementation VCMain
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.nGameButton.layer.cornerRadius=CORNER_RADIUS;
    self.continueButton.layer.cornerRadius=CORNER_RADIUS;
    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}
- (void) viewWillAppear:(BOOL)animated
{
    if(self.game==nil || [self.game getGameState]==GameStateEnd)
        self.continueButton.layer.hidden=YES;
    else self.continueButton.layer.hidden=NO;
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context)
    {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    }completion:^(id<UIViewControllerTransitionCoordinatorContext> context)
    {
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) isGameBegining:(Cards*)game
{
    self.game=game;
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"mode"])
    {
        VCMode *controller = (VCMode *)segue.destinationViewController;
        controller.delegate=self;
    }
    else if([segue.identifier isEqualToString:@"continue"])
    {
        VCGame *controller = (VCGame *)segue.destinationViewController;
        controller.game = self.game;
    }
}
@end
