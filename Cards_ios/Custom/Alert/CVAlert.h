//
//  CVAlert.h
//  Cards_ios
//
//  Created by Георгий Зубков on 23.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VCGame.h"
@interface CVAlert : UIAlertController
@property UITextField *nameField;
+ (CVAlert*) createAlertGameEnd;
+ (CVAlert*) createAlertError;
+ (CVAlert*) createAlertWithTitle:(NSString*)title message:(NSString*)message;
- (void) addButton:(NSString *)title selector:(SEL)sel;
- (void) addButton:(nullable NSString*)title action:(void (^ __nullable) (void))actions;
- (void) addTextField:(NSString*) placeholder textColor:(UIColor*)color textFieldMode:(UITextFieldViewMode)mode borderStyle:(UITextBorderStyle)style;
- (void) show:(BOOL)animated view:(UIViewController*)view;
@end
