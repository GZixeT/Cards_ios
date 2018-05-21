//
//  Deck.m
//  Cards_ios
//
//  Created by Георгий Зубков on 21.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
#import "GameCard.h"

@implementation Deck
- (id) init{
    if(self= [super init])
        self.deck=[[NSMutableArray alloc]init];
    return self;
}
+ (Deck*) createRandomDeck:(NSInteger)count{
    Deck *rDeck= [[Deck alloc]init];
    for(int i=0;i<count;i++){
        [rDeck.deck addObject:[GameCard createRandomCard]];
    }
    return rDeck;
}
+ (Deck*) createRandomDoubleDeck:(NSInteger)count
{
    Deck *rDeck= [[Deck alloc]init];
    for (int i = 0; i < count; i++)
    {
        GameCard *randomCacrd = [GameCard createRandomCard];
        for (int j = 0; j < 2; j++)
            rDeck.deck[i*2+j] = [randomCacrd copy];
    }
    [rDeck shuffleMapElements];
    return rDeck;
}
- (BOOL) isContainsInDeck:(id)card{
    for(int i=0;i<self.deck.count;i++){
        GameCard *dCard=self.deck[i];
        if([dCard isEqual:card])
            return YES;
    }
    return NO;
}
- (void) shuffleMapElements{
    int index=0;
    id tmp;
    for(int i=0;i<self.deck.count;i++)
    {
        index= (int)(arc4random() % (int) (self.deck.count-i) + i);
        tmp=self.deck[i];
        [self.deck replaceObjectAtIndex:i withObject:self.deck[index]];
        [self.deck replaceObjectAtIndex:index withObject:tmp];
    }
}
- (NSArray*) getCardsWithState:(TableOption)state
{
    return [self.deck filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(GameCard *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return evaluatedObject.state == state;
    }]];
}
@end
