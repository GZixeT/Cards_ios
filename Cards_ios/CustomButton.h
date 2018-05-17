//
//  CustomButton.h
//  Cards_ios
//
//  Created by Георгий Зубков on 17.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton
@property CGFloat vPercent;
- (void) setHorizontalCenterForScreen:(CGFloat) width;
- (void) setVerticalForScreen:(CGFloat)height;
- (void) verticalPercent:(CGFloat) height;
@end
