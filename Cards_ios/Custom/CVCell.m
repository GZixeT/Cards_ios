//
//  CollectionViewCell.m
//  Cards_ios
//
//  Created by Георгий Зубков on 17/05/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "CVCell.h"
#import "UICCard.h"

@implementation CVCell
@synthesize card=_card;
- (void) setValueLabelText
{
    NSString *value;
    switch (self.card.value)
    {
        case CardValueAce:
            value=@"A";
            break;
        case CardValueKing:
            value=@"K";
            break;
        case CardValueQueen:
            value=@"Q";
            break;
        case CardValueJack:
            value=@"J";
            break;
        default:
            value=[NSString stringWithFormat:@"%d",self.card.value];
            break;
    }
    self.labelValue.text=value;
}
- (void) setSuitLabelText
{
    NSString *suit;
    switch (self.card.suit)
    {
        case CardSuitClubs:
            suit=@"♣️";
            [self.labelSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitHeards:
            suit=@"♥️";
            [self.labelSuit setTextColor:[UICCard Red]];
            break;
        case CardSuitSpades:
            suit=@"♠️";
            [self.labelSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitDiamonds:
            suit=@"♦️";
            [self.labelSuit setTextColor:[UICCard Red]];
            break;
    }
    self.labelSuit.text=suit;
}
- (void) setCard:(Card *)card
{
    _card=card;
    [self setValueLabelText];
    [self setSuitLabelText];
}
- (void)awakeFromNib
{
    [super awakeFromNib];
    [self.layer setCornerRadius:10];
}
- (void) setBackProperties
{
    self.labelSuit.hidden=YES;
    self.labelValue.text = @"?";
    [self.labelValue setTextColor:[UICCard White]];
    [self setBackgroundColor:[UICCard Blue]];
}
- (void) setForwardProperties
{
    self.labelSuit.hidden=NO;
    [self.labelValue setTextColor:[UICCard Black]];
    [self setBackgroundColor:[UICCard White]];
}
@end
