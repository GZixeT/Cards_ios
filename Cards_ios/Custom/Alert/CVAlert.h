//
//  CVAlert.h
//  Cards_ios
//
//  Created by Георгий Зубков on 23.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CVAlert : UIAlertController
+ (CVAlert*) createAlertGameEnd;
- (void) addButton:(nullable NSString*)title action:(void (^ __nullable) (void))actions;
- (void) show:(BOOL)animated view:(UIViewController*)view;
@end
