//
//  GameCard.h
//  Cards_ios
//
//  Created by Георгий Зубков on 21.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "Card.h"

typedef enum{
    TableOptionDisable,
    TableOptionEnable,
    TableOptionLock
}TableOption;

@interface GameCard : Card
@property TableOption state;
@end
