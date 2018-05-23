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
#import "CVAlert.h"


@interface VCGame ()
@end

@implementation VCGame

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count =self.game.deck.count;
    return count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"Cell_ID";
    CVCell *cell = (CVCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSInteger index=indexPath.item;
    [cell setCard:self.game.deck[index]];
    GameCard *card=self.game.deck[index];
    if(card.state==TableOptionLock)
        [cell setForwardProperties];
    else [cell setBackProperties];
    if([self.game getGameState]==GameStateEnd)
    {
        CVAlert *alert=[CVAlert createAlertGameEnd];
        [self presentViewController:alert animated:YES completion:nil];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CVCell *cell = (CVCell*)[collectionView cellForItemAtIndexPath:indexPath];
    NSInteger index=indexPath.item;
    [cell setCard:self.game.deck[index]];
    [cell setForwardProperties];
    if([self.game makeTaskAtIndex:index :TableOptionEnable])
    {
        switch([self.game getGameState])
        {
            case GameStateFalse:
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f  target:self selector:@selector(updateTimer:) userInfo:indexPath repeats:YES];
                break;
            case GameStateEnd:
                printf("Победа!\n");
                [self.cView reloadData];
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
- (void) updateTimer:(NSTimer*)timer
{
    NSLog(@"Timer Begin");
    NSIndexPath *index=timer.userInfo;
    CVCell *cell = (CVCell*)[self.cView cellForItemAtIndexPath:index];
    if(cell.labelSuit.hidden==NO)
    {
        [cell setBackProperties];
        [self.cView reloadData];
        [timer invalidate];
        NSLog(@"End Timer");
    }
    else
    {
        [cell setForwardProperties];
    }
}
@end
