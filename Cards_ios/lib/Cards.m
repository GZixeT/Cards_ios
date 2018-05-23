//
//  Cards.m
//  ObjC_Cards(v.3)
//
//  Created by Георгий Зубков on 19.04.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

//Проба коммита 2
#import "Cards.h"


#define TABLE_NO_ONE_CARD_OPEN 0
#define TABLE_ONE_CARD_OPEN 1
#define TABLE_TWO_CARDS_OPEN 2


@implementation Cards
+ (instancetype) createRandomDeck:(NSInteger)count
{
    Cards *rDeck= [[Cards alloc]init];
    for(int i=0;i<count;i++)
    {
        [rDeck.deck addObject:[GameCard createRandomCard]];
    }
    return rDeck;
}
+ (instancetype) createRandomDoubleDeck:(NSInteger)count
{
    Cards *rDeck= [[Cards alloc]init];
    for (int i = 0; i < count; i++)
    {
        GameCard *randomCacrd = [GameCard createRandomCard];
        for (int j = 0; j < 2; j++)
            rDeck.deck[i*2+j] = [randomCacrd copy];
    }
    [rDeck shuffleMapElements];
    return rDeck;
}
- (BOOL) makeTaskAtIndex:(NSInteger)index :(TableOption)option
{
    GameCard *card=self.deck[index];
    if(card.state==TableOptionLock)
    {
        NSLog(@"Карта заблокирована!");
        return NO;
    }
    else card.state=option;
    return YES;
}
- (GameState) getGameState
{
    NSArray *enableCards=[self getCardsWithState:TableOptionEnable];
    switch(enableCards.count)
    {
        case TABLE_NO_ONE_CARD_OPEN:
            if([self getCardsWithState:TableOptionLock].count==self.deck.count)
                return GameStateEnd;
            return GameStateTrue;
            break;
        case TABLE_ONE_CARD_OPEN:
            return GameStateTrue;
            break;
        case TABLE_TWO_CARDS_OPEN:
        {
            GameCard *first = enableCards[0];
            GameCard *second = enableCards[1];
            if([first isEqual:second])
            {
                [first setState:TableOptionLock];
                [second setState:TableOptionLock];
                if([self getCardsWithState:TableOptionLock].count==self.deck.count)
                    return GameStateEnd;
                return GameStateTrue;
            }
            else
            {
                [first setState:TableOptionDisable];
                [second setState:TableOptionDisable];
                return GameStateFalse;
            }
        }break;
    }
    return GameStateError;
}
@end
