//
//  Deck.h
//  Cards_ios
//
//  Created by Георгий Зубков on 21.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameCard.h"
@interface Deck : NSObject
@property NSMutableArray *deck;
+ (instancetype) createRandomDeck:(NSInteger)count;
+ (instancetype) createRandomDoubleDeck:(NSInteger)count;
- (BOOL) isContainsInDeck:(id)card;
- (void) shuffleMapElements;
- (NSArray*) getCardsWithState:(TableOption)state;
@end
