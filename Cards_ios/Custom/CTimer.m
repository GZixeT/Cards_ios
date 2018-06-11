//
//  CTimer.m
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "CTimer.h"

@implementation CTimer
+ (CTimer*) createTimerWithInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo lock:(BOOL)lock{
    CTimer* timer=[[CTimer alloc]init];
    timer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    timer.lock=lock;
    return timer;
}
@end
