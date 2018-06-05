//
//  CVAlert.m
//  Cards_ios
//
//  Created by Георгий Зубков on 23.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "CVAlert.h"

@implementation CVAlert
+ (CVAlert*) createAlertGameEnd
{
    CVAlert *alert=[CVAlert alertControllerWithTitle:@"Game" message:@"You won!" preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}
- (void) addButton:(nullable NSString*)title action:(void (^ __nullable) (void))actions
{
    UIAlertAction *button = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action)
    {
        actions();
    }];
    [self addAction:button];
}
- (void) show:(BOOL)animated view:(UIViewController*)view
{
    [view presentViewController:self animated:animated completion:nil];
}
@end
