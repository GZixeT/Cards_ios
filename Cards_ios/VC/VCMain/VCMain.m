//
//  ViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#import "VCMain.h"
#import "VCGame.h"
#define CORNER_RADIUS 10

@implementation VCMain
- (void)viewDidLoad {
    [super viewDidLoad];
    self.nGameButton.layer.cornerRadius=CORNER_RADIUS;
    self.continueButton.layer.cornerRadius=CORNER_RADIUS;
    self.exitButton.layer.cornerRadius=CORNER_RADIUS;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    } completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ExitButtonClick:(id)sender {
    [[Cards sharedInstance].map removeAllObjects];
    exit(0);
}
- (IBAction)ContinueButtonClick:(id)sender {
    UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    VCGame *continueController = (VCGame*)[storyboard instantiateViewControllerWithIdentifier:@"Game"];
    if(continueController)
    {
        if([Cards sharedInstance].map.count>0){
            continueController.cardsManager = [Cards sharedInstance];
            [self.navigationController pushViewController:continueController animated:YES];
        }
        else{
            
        }
    }
}


@end
