//
//  GameScore.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define POINT 100
#define DOUBLE_DECK 2 // для создания одинаковых карт количество карт(mode) умножается на 2

#import "GameScore.h"

@implementation GameScore
- (float) getScore{
    float score = 0;
    float maxPoints = (POINT * self.mode * DOUBLE_DECK);
    float multiplier = (self.mode * DOUBLE_DECK)/(self.clickCount);
    float time = maxPoints / self.timerTick;
    score = maxPoints * multiplier * time;
    return score;
}
- (float) timerTickCounter{
    if(self.timer.lock)
        return self.timerTick;
    return self.timerTick+=0.1;
}
- (void) setTimerWithMode:(NSInteger)mode{
    self.mode = mode;
    self.clickCount = 0;
    self.timerTick = 0;
    self.timer = [CTimer createTimerWithInterval:0.1 target:self selector:@selector(timerTickCounter) userInfo:nil repeats:YES lock:NO];
}
- (void) setTimerPause{
    self.timer.lock = YES;
}
- (void) setTimerContinue{
    self.timer.lock = NO;
}
@end
