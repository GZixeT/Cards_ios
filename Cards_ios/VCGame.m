//
//  GameViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "VCGame.h"
#import "VCMode.h"
#import "Card.h"
#import "Cards.h"
#import "UICCard.h"
#import "CVAlert.h"
#import "BCVCell.h"

#define NUMBER_OF_COLUMS 4
#define LINE_SPACING 5
#define CELL_SPACING 5

@interface VCGame ()
@property GameMode mode;
@property NSString *cellID;
@property BOOL lockedCollectionView;
@end

@implementation VCGame

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setNavBarTitle];
    self.cellID=@"BCVCell_ID";
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle: nil];
    [self.cView registerNib:nib forCellWithReuseIdentifier:self.cellID];
    
}
- (void) setNavBarTitle{
    if(self.game.deck.count==GameModeEasy*2){
        self.navigationItem.title=@"Easy Mode";
        self.mode=GameModeEasy;
    }
    else if (self.game.deck.count==GameModeMiddle*2){
        self.navigationItem.title=@"Middle Mode";
        self.mode=GameModeMiddle;
    }
    else if (self.game.deck.count==GameModeHard*2){
        self.navigationItem.title=@"Hard Mode";
        self.mode=GameModeHard;
    }
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (void) showGameEndAlert: (UICollectionView*)view{
    CVAlert *alert=[CVAlert createAlertGameEnd];
    [alert addTextField:@"name" textColor:[UIColor blueColor] textFieldMode:UITextFieldViewModeWhileEditing borderStyle:UITextBorderStyleRoundedRect];
    [alert addButton:@"Новая игра" action:^{
        self.game=[Cards createRandomDoubleDeck:self.mode];
        [self.delegate isGameBegining:self.game];
        [view reloadData];
    }];
    [alert addButton:@"OK" action:^{
        UINavigationController *navigationController = self.navigationController;
        [navigationController popViewControllerAnimated:YES];
    }];
    [alert show:YES view:self];
}
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    // Code here will execute before the rotation begins.
    // Equivalent to placing it in the deprecated method -[willRotateToInterfaceOrientation:duration:]
    [self.cView.collectionViewLayout invalidateLayout];
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext> context){
        
        // Place code here to perform animations during the rotation.
        // You can pass nil or leave this block empty if not necessary.
        
    }completion:^(id<UIViewControllerTransitionCoordinatorContext> context){
        // Code here will execute after the rotation has finished.
        // Equivalent to placing it in the deprecated method -[didRotateFromInterfaceOrientation:]
        [self.cView.collectionViewLayout invalidateLayout];
    }];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count =self.game.deck.count;
    return count;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return LINE_SPACING;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return CELL_SPACING;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat width;
    CGFloat height;
    NSInteger lines = self.game.deck.count/NUMBER_OF_COLUMS;
    CGFloat cWSize=collectionView.frame.size.width;
    CGFloat cHSize=collectionView.frame.size.height;
    width = ceilf((cWSize- CELL_SPACING*(NUMBER_OF_COLUMS+1))/NUMBER_OF_COLUMS);
    height = ceilf((cHSize - LINE_SPACING * (lines+1))/lines);
    if(height>width*2)
        height=width*1.5;
    return CGSizeMake(width, height);
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index=indexPath.item;
    BCVCell *cell = (BCVCell*)[collectionView dequeueReusableCellWithReuseIdentifier:self.cellID forIndexPath:indexPath];
    [cell setCard:self.game.deck[index]];
    GameCard *card=self.game.deck[index];
    if(card.state==TableOptionLock ||
       card.state==TableOptionEnable)[cell setForwardProperties];
    else [cell setBackProperties];
    if([self.game getGameState]==GameStateEnd){
        [self showGameEndAlert:collectionView];
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.lockedCollectionView==NO){
        BCVCell *cell = (BCVCell*)[collectionView cellForItemAtIndexPath:indexPath];
        NSInteger index=indexPath.item;
        [cell setCard:self.game.deck[index]];
        [cell setForwardProperties];
        if([self.game makeTaskAtIndex:index :TableOptionEnable]){
            switch([self.game getGameState]){
                case GameStateFalse:
                    self.lockedCollectionView=YES;
                    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:indexPath repeats:YES];
                    break;
                case GameStateEnd:
                    printf("Победа!\n");
                    [self.cView reloadData];
                    break;
                case GameStateError:{
                    [[CVAlert createAlertError]show:YES view:self];
                }break;
                case GameStateTrue:
                    break;
                default:{
                    [[CVAlert createAlertError]show:YES view:self];
                }break;
            }
        }
    }
    
}
- (void) updateTimer:(NSTimer*)timer{
    NSLog(@"Timer Begin");
    NSIndexPath *index=timer.userInfo;
    BCVCell *cell = (BCVCell*)[self.cView cellForItemAtIndexPath:index];
    if(cell.labelFirstSuit.hidden==NO){
        [cell setBackProperties];
        [self.cView reloadData];
        //[self.cView.collectionViewLayout invalidateLayout];
        [timer invalidate];
        self.lockedCollectionView=NO;
        NSLog(@"End Timer");
    }
    else{
        [cell setForwardProperties];
    }
}
@end
