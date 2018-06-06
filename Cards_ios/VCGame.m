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

#define NUMBER_OF_COLUMS 4
#define LINE_SPACING 5
#define CELL_SPACING 5

@interface VCGame ()
@end

@implementation VCGame

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNavBarTitle];
    
}
- (void) setNavBarTitle
{
    if(self.game.deck.count==GameModeEasy*2)
        self.navigationItem.title=@"Easy Mode";
    else if (self.game.deck.count==GameModeMiddle*2)
        self.navigationItem.title=@"Middle Mode";
    else if (self.game.deck.count==GameModeHard*2)
        self.navigationItem.title=@"Hard Mode";
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator
{
    [self.cView.collectionViewLayout invalidateLayout];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSInteger count =self.game.deck.count;
    return count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return LINE_SPACING;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return CELL_SPACING;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger lines=self.game.deck.count/NUMBER_OF_COLUMS;
    CGFloat width=collectionView.frame.size.width/NUMBER_OF_COLUMS - CELL_SPACING;
    CGFloat height=collectionView.frame.size.height/lines - LINE_SPACING;
    if(height>width*2)
        height=width*1.5;
    return CGSizeMake(width, height);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger index=indexPath.item;
    static NSString *identifier = @"Cell_ID";
    CVCell *cell = (CVCell*)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    [cell setCard:self.game.deck[index]];
    GameCard *card=self.game.deck[index];
    if(card.state==TableOptionLock || card.state==TableOptionEnable)
        [cell setForwardProperties];
    else [cell setBackProperties];
    if([self.game getGameState]==GameStateEnd)
    {
        CVAlert *alert=[CVAlert createAlertGameEnd];
        [alert addButton:@"Новая игра" action:^
        {
            
        }];
        [alert addButton:@"OK" action:nil]; // воз здесь нужен nil
        [alert show:YES view:self];
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
