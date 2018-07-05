//
//  Cards.h
//  ObjC_Cards(v.3)
//
//  Created by Георгий Зубков on 19.04.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "GameCard.h"
typedef enum
{
    GameStateTrue =1,
    GameStateFalse,
    GameStateEnd,
    GameStateError
}GameState;

@interface Cards : Deck
- (BOOL) makeTaskAtIndex:(NSInteger)index :(TableOption)option;
- (int) getFirstSameStateCardNumberWithNotEqualNumber:(NSInteger)noEqual;
- (GameState) getGameState;
@end
