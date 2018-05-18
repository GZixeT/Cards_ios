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
    [cell.layer setCornerRadius:10];
    [cell setCard:[Cards sharedInstance].map[index]];
    cell.labelValue.text = @"?";
//    UILabel *label=(UILabel*)[cell viewWithTag:LABEL_IDENTIFIER];
//    [label setText:@"?"];
    // recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVCell *cell = (CVCell*)[collectionView cellForItemAtIndexPath:indexPath];
    cell.labelSuit.hidden=NO;
    NSString *value,*suit;
    switch (cell.card.value) {
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
            value=[NSString stringWithFormat:@"%d",cell.card.value];
            break;
    }
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
    cell.labelSuit.text = suit;
    cell.labelValue.text = value;
    [cell.labelValue setTextColor:[UICCard Black]];
    [cell setBackgroundColor:[UICCard White]];
    
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
