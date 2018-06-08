//
//  BCVCell.m
//  Cards_ios
//
//  Created by Георгий Зубков on 07/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "BCVCell.h"
#import "UICCard.h"

@implementation BCVCell
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
            [self.labelFirstSuit setTextColor:[UICCard Black]];
            [self.labelSecondSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitHeards:
            suit=@"♥️";
            [self.labelFirstSuit setTextColor:[UICCard Red]];
            [self.labelSecondSuit setTextColor:[UICCard Red]];
            break;
        case CardSuitSpades:
            suit=@"♠️";
            [self.labelFirstSuit setTextColor:[UICCard Black]];
            [self.labelSecondSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitDiamonds:
            suit=@"♦️";
            [self.labelFirstSuit setTextColor:[UICCard Red]];
            [self.labelSecondSuit setTextColor:[UICCard Red]];
            break;
    }
    self.labelFirstSuit.text=suit;
    self.labelSecondSuit.text=suit;
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
    self.labelFirstSuit.hidden=YES;
    self.labelSecondSuit.hidden=YES;
    self.labelValue.text = @"?";
    [self.labelValue setTextColor:[UICCard White]];
    [self setBackgroundColor:[UICCard Blue]];
}
- (void) setForwardProperties
{
    self.labelFirstSuit.hidden=NO;
    self.labelSecondSuit.hidden=NO;
    [self.labelValue setTextColor:[UICCard Black]];
    [self setBackgroundColor:[UICCard White]];
}
@end
