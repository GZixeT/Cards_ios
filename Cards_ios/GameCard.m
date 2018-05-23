//
//  GameCard.m
//  Cards_ios
//
//  Created by Георгий Зубков on 21.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define RAND_FROM_TO(min, max) (min + arc4random_uniform(max - min + 1))
#import "GameCard.h"

@implementation GameCard
+ (instancetype)createRandomCard
{
    GameCard *card=[[GameCard alloc]init];
    CardValue v = RAND_FROM_TO(CardValueTwo, CardValueAce);
    CardSuit s = RAND_FROM_TO(CardSuitDiamonds, CardSuitClubs);
    [card setValue:v];
    [card setSuit:s];
    [card setState:TableOptionDisable];
    return card;
}
- (id) copy
{
    GameCard *card=[[GameCard alloc]init];
    card.value=self.value;
    card.suit=self.suit;
    card.state=self.state;
    return card;
}
- (BOOL) isEqual:(id)object
{
    GameCard *card=object;
    if([super isEqual:card] && self.state==card.state)
        return YES;
    return NO;
}
@end
