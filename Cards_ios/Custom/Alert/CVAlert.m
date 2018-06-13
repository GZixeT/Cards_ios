//
//  CVAlert.m
//  Cards_ios
//
//  Created by Георгий Зубков on 23.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "CVAlert.h"

@implementation CVAlert
+ (CVAlert*) createAlertGameEnd{
    CVAlert *alert=[CVAlert alertControllerWithTitle:@"Game" message:@"You won!" preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}
+ (CVAlert*) createAlertError{
    CVAlert *alert=[CVAlert alertControllerWithTitle:@"Game" message:@"Error!" preferredStyle:UIAlertControllerStyleAlert];
    [alert addButton:@"OK" action:nil];
    return alert;
}
+ (CVAlert*) createAlertWithTitle:(NSString*)title message:(NSString*)message{
    CVAlert *alert=[CVAlert alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    return alert;
}
- (void) addButton:(nullable NSString*)title action:(void (^ __nullable) (void))actions{
    UIAlertAction *button;
    if (actions){
        button = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
            actions();
        }];
        [self addAction:button];
    }
    else{
        button = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:nil];
        [self addAction:button];
    }
}
- (void) addButton:(NSString *)title selector:(SEL)sel{
    void(^block)(void) =^{[UIView performSelector:sel];};
    UIAlertAction *button = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        block();
    }];
    [self addAction:button];
}
- (void) show:(BOOL)animated view:(UIViewController*)view
{
    [view presentViewController:self animated:animated completion:nil];
}
- (void) addTextField:(NSString*) placeholder textColor:(UIColor*)color textFieldMode:(UITextFieldViewMode)mode borderStyle:(UITextBorderStyle)style{
    UITextField *textField = [[UITextField alloc]init];
    textField.placeholder = placeholder;
    textField.textColor = color;
    textField.clearButtonMode = mode;
    textField.borderStyle = style;
    self.nameField=textField;
    [self addTextFieldWithConfigurationHandler:^(UITextField *text){
        text=self.nameField;
    }];
}
@end
