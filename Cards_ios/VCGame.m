//
//  GameViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "VCGame.h"
#import "CVCell.h"
#import "Card.h"
#import "Cards.h"
#import "UICCard.h"

@interface VCGame ()
@end

@implementation VCGame

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.cView setDataSource:self];
    //[self.cView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count=[Cards sharedInstance].map.count;
    return count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell_ID";
    
    CVCell *cell = (CVCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSInteger index=indexPath.item;
    NSString *value,*suit;
    [cell.layer setCornerRadius:10];
    [cell setCard:[Cards sharedInstance].map[index]];
    Card *card=[Cards sharedInstance].map[index];
    value = [self setCardValueForString:cell.card.value];
    suit = [self setCardSuitForString:cell];
    if(card.open){
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
    if([[Cards sharedInstance]getGameState]==GameStateEnd)
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
    if([[Cards sharedInstance]makeTaskWithCardAtIndex:index :true])
    {
        switch([[Cards sharedInstance]getGameState])
        {
            case GameStateFalse:
                cell.labelSuit.hidden=YES;
                cell.labelValue.text = @"?";
                [cell.labelValue setTextColor:[UICCard White]];
                [cell setBackgroundColor:[UICCard Blue]];
                //[NSThread sleepForTimeInterval:1.0];
                [self.cView reloadData];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
