//
//  CTimer.h
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTimer : NSObject
@property BOOL lock;
@property NSTimer* timer;
+ (CTimer*) createTimerWithInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo lock:(BOOL)lock;
@end
