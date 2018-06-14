//
//  GameScore.h
//  Cards_ios
//
//  Created by Георгий Зубков on 14/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CTimer.h"

@interface GameScore : NSObject
@property CTimer *timer;
@property float mode;
@property float clickCount;
@property float timerTick;
- (float) getScore;
- (float) timerTickCounter;
- (void) setTimerWithMode:(NSInteger)mode;
- (void) setTimerPause;
- (void) setTimerContinue;
@end
