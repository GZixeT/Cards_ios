//
//  Card.m
//  ObjC_Cards(v.3)
//
//  Created by Георгий Зубков on 19.04.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))
#import "Card.h"

@implementation Card
@synthesize value;
@synthesize suit;
+(instancetype) createRandomCard
{
    Card *card=[[Card alloc]init];
    CardValue v = RAND_FROM_TO(CardValueTwo, CardValueAce);
    CardSuit s = RAND_FROM_TO(CardSuitDiamonds, CardSuitClubs);
    [card setValue:v];
    [card setSuit:s];
    return card;
}
- (id) copy
{
    Card *card=[[Card alloc]init];
    [card setValue:value];
    [card setSuit:suit];
    return card;
}
- (BOOL) isEqual:(id)object
{
    Card *card=object;
    if(card.suit==self.suit && card.value==self.value)
        return YES;
    return NO;
}
@end
