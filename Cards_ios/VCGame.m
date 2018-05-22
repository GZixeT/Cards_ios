//
//  GameViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "VCGame.h"
#import "VCMode.h"
#import "CVCell.h"
#import "Card.h"
#import "Cards.h"
#import "UICCard.h"


@interface VCGame ()
@end

@implementation VCGame

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UIStoryboard *storyboard=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //VCMode *gameController = (VCMode*)[storyboard instantiateViewControllerWithIdentifier:@"Mode"];
    //self.delegate=gameController;
    //self.game=[self.delegate getGame];
    //[self.cView setDataSource:self];
    //[self.cView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count =self.game.deck.count;
    return count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell_ID";
    
    CVCell *cell = (CVCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSInteger index=indexPath.item;
    NSString *value,*suit;
    [cell.layer setCornerRadius:10];
    [cell setCard:self.game.deck[index]];
    GameCard *card=self.game.deck[index];
    value = [self setCardValueForString:cell.card.value];
    suit = [self setCardSuitForString:cell];
    if(card.state==TableOptionLock){
        cell.labelSuit.text = suit;
        cell.labelValue.text = value;
        cell.labelSuit.hidden=NO;
        [cell.labelValue setTextColor:[UICCard Black]];
        [cell setBackgroundColor:[UICCard White]];
    }
    else{
        cell.labelSuit.hidden=YES;
        cell.labelValue.text = @"?";
        [cell.labelValue setTextColor:[UICCard White]];
        [cell setBackgroundColor:[UICCard Blue]];
    }
    if([self.game getGameState]==GameStateEnd)
    {
        [self.EGLabel setText:@"Победа"];
        [self.EGLabel setHidden:NO];
    }
//    UILabel *label=(UILabel*)[cell viewWithTag:LABEL_IDENTIFIER];
//    [label setText:@"?"];
    // recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
    return cell;
}
- (NSString*) setCardValueForString:(int)CValue{
    NSString *value;
    switch (CValue) {
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
            value=[NSString stringWithFormat:@"%d",CValue];
            break;
    }
    return value;
}
- (NSString*) setCardSuitForString:(CVCell*)cell{
    NSString *suit;
    switch (cell.card.suit) {
        case CardSuitClubs:
            suit=@"♣️";
            [cell.labelSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitHeards:
            suit=@"♥️";
            [cell.labelSuit setTextColor:[UICCard Red]];
            break;
        case CardSuitSpades:
            suit=@"♠️";
            [cell.labelSuit setTextColor:[UICCard Black]];
            break;
        case CardSuitDiamonds:
            suit=@"♦️";
            [cell.labelSuit setTextColor:[UICCard Red]];
            break;
    }
    return suit;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVCell *cell = (CVCell*)[collectionView cellForItemAtIndexPath:indexPath];
    NSInteger index=indexPath.item;
    NSString *value,*suit;
    value = [self setCardValueForString:cell.card.value];
    suit = [self setCardSuitForString:cell];
    cell.labelSuit.text = suit;
    cell.labelValue.text = value;
    cell.labelSuit.hidden=NO;
    [cell.labelValue setTextColor:[UICCard Black]];
    [cell setBackgroundColor:[UICCard White]];
    if([self.game makeTaskAtIndex:index :TableOptionEnable])
    {
        switch([self.game getGameState])
        {
            case GameStateFalse:
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f  target:self selector:@selector(updateTimer:) userInfo:indexPath repeats:YES];
                //[NSThread sleepForTimeInterval:1.0];
                break;
            case GameStateEnd:
                [self.EGLabel setText:@"Победа"];
                [self.EGLabel setHidden:NO];
                printf("Победа!\n");
                break;
            case GameStateError:
                printf("Error.\n");
                break;
            case GameStateTrue:
                break;
            default:
                printf("Error.\n");
                break;
        }
    }
    
}
- (void) updateTimer:(NSTimer*)timer{
    NSLog(@"Timer Begin");
    id index=timer.userInfo;
    CVCell *cell = (CVCell*)[self.cView cellForItemAtIndexPath:index];
    //NSInteger index=indexPath.item;
    NSString *value,*suit;
    value = [self setCardValueForString:cell.card.value];
    suit = [self setCardSuitForString:cell];
    if(cell.labelSuit.hidden==NO){
        cell.labelSuit.hidden=YES;
        cell.labelValue.text = @"?";
        [cell.labelValue setTextColor:[UICCard White]];
        [cell setBackgroundColor:[UICCard Blue]];
        [self.cView reloadData];
        [timer invalidate];
        NSLog(@"End Timer");
    }
    else{
        cell.labelSuit.text = suit;
        cell.labelValue.text = value;
        cell.labelSuit.hidden=NO;
        [cell.labelValue setTextColor:[UICCard Black]];
        [cell setBackgroundColor:[UICCard White]];
    }
}
@end
