//
//  CustomButton.m
//  Cards_ios
//
//  Created by Георгий Зубков on 17.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "CustomButton.h"
#define CORNER_RADIUS 10
@implementation CustomButton
@synthesize vPercent;
-(void) setHorizontalCenterForScreen:(CGFloat) width{
    CGPoint currentPossition = [[self layer]position];
    CGPoint nPossition=CGPointMake(width/2, currentPossition.y);
    [[self layer]setPosition:nPossition];
    [[self layer]setCornerRadius:CORNER_RADIUS];
}
- (void) setVerticalForScreen:(CGFloat)height{
    CGPoint currentPossition = [[self layer]position];
    CGPoint nPossition=CGPointMake(currentPossition.x, height*vPercent);
    [[self layer]setPosition:nPossition];
    [[self layer]setCornerRadius:CORNER_RADIUS];
}
- (void) verticalPercent:(CGFloat) height{
    CGPoint currentPossition = [[self layer]position];
    self.vPercent=currentPossition.y/height;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
