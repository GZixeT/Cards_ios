//
//  Card.m
//  ObjC_Cards(v.3)
//
//  Created by Георгий Зубков on 19.04.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "Card.h"

@implementation Card
@synthesize value;
@synthesize suit;
@synthesize open;
+(id) createRandomCard{
    Card *card=[[Card alloc]init];
    //CardValue v=(CardValue) (arc4random() % (NSInteger) CardValueAce);
    //CardSuit s=(CardSuit)(arc4random() % (NSInteger) CardSuitClubs);
    CardValue v=arc4random_uniform(CardValueAce)+CardValueTwo;
    CardSuit s= arc4random_uniform(CardSuitClubs)+CardSuitDiamonds;
    [card setValue:v];
    [card setSuit:s];
    if(v==0)
        NSLog(@"Как так то?");
    return card;
}
- (id) copy{
    Card *card=[[Card alloc]init];
    [card setOpen:open];
    [card setValue:value];
    [card setSuit:suit];
    return card;
}
- (BOOL) isEqual:(id)object{
    if(object!=nil)
    {
        Card *card=object;
        if([card value]==value &&
           [card suit]==suit && [card open]==open){
            return true;
        }
        else return false;
    }
    else NSLog(@"Пустой элемент");
    return false;
}
- (BOOL) isContainsInArray:(NSMutableArray *)array{
    if(!array || [array count]==0)return false;
    for(int i=0;i<[array count];i++)
        if([self isEqual:array[i]])
            return true;
    return false;
}
-(NSMutableArray*)getRandomArray:(NSInteger)count{
    NSMutableArray *array=[[NSMutableArray alloc]initWithObjects:[Card createRandomCard], nil];
    for(int i=1;i<count;i++){
        [array addObject:[Card createRandomCard]];
    }
    return array;
}
@end
