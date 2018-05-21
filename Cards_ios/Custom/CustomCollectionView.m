//
//  CustomCollectionView.m
//  Cards_ios
//
//  Created by Георгий Зубков on 17.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define CVIEW_IDENTIFIER 100
#define CELL_IDENTIFIER 101

#import "CustomCollectionView.h"

@implementation CustomCollectionView
-(void) setCollectionViewToCenterScreen:(CGFloat)width{
    CGPoint currentPossition = [[self layer]position];
    CGPoint nPossition=CGPointMake(width/2, currentPossition.y);
    [[self layer]setPosition:nPossition];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
