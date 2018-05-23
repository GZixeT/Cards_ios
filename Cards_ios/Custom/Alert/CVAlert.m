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
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action)
    {
        
    }];
    
    [alert addAction:defaultAction];
    return alert;
}
@end
