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
#import "User.h"
#import "VCTableOfResults.h"

#define NUMBER_OF_COLUMS 4
#define LINE_SPACING 5
#define CELL_SPACING 5

@interface VCGame ()
@property GameMode mode;
@property NSString *cellID;
@property User *user;
@property BOOL gameEnd;
@end

@implementation VCGame

- (void)viewDidLoad{
    [super viewDidLoad];
    [self setNavBarTitle];
    self.cellID=@"BCVCell_ID";
    UINib *nib = [UINib nibWithNibName:@"Cell" bundle: nil];
    [self.cView registerNib:nib forCellWithReuseIdentifier:self.cellID];
    self.user = [[User alloc]init];
    self.score = [[GameScore alloc]init];
    [self.score setTimerWithMode:self.mode];
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:nil];
    self.navigationItem.backBarButtonItem = back;
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
- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if([self.game getGameState]==GameStateEnd){
        [self showGameEndAlert:self.cView];
    }
    else if(self.score.timer)
            [self.score setTimerContinue];
    else [self.score setTimerWithMode:self.mode];
}
- (void) viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    if(!self.gameEnd)
       [self.score setTimerPause];
    
}
- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
- (void) buttonTableAction:(NSString*)text{
    NSUserDefaults *userDef=[NSUserDefaults standardUserDefaults];
    self.user = [User createUserWithName:text score:[self.score getScore] mode:self.mode];
    NSArray *old = [userDef objectForKey:USERS_ARR_KEY];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.user];
    NSMutableArray *nArr = [NSMutableArray arrayWithArray:old];
    [nArr addObject:data];
    [userDef setObject:nArr forKey:USERS_ARR_KEY];
    [userDef synchronize];
    
    [self performSegueWithIdentifier:@"TableOfResult" sender:nil];
    self.navigationItem.leftBarButtonItem=nil;
}
- (void) showGameEndAlert: (UICollectionView*)view{
    CVAlert *alert=[CVAlert createAlertGameEnd];
    [alert addTextField:@"name" textColor:[UIColor blueColor] textFieldMode:UITextFieldViewModeWhileEditing borderStyle:UITextBorderStyleRoundedRect];
    UIAlertAction *action = [UIAlertAction actionWithTitle:@"К таблице результатов" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        if(![alert.textFields[0].text isEqualToString:@""])
            [self buttonTableAction:alert.textFields[0].text];
        else{
            CVAlert *error = [CVAlert createAlertWithTitle:@"Ошибка" message:@"Пустое имя"];
            [error addButton:@"OK" action:^{
                [alert show:YES view:self];
            }];
            [error show:YES view:self];
        }
    }];
    
    [alert addAction:action];
    [alert addButton:@"Новая игра" action:^{
        self.game=[Cards createRandomDoubleDeck:self.mode];
        [self.delegate isGameBegining:self.game];
        self.score = [[GameScore alloc]init];
        [self.score setTimerWithMode:self.mode];
        [view reloadData];
        self.gameEnd = NO;
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
    if([self.game getGameState]==GameStateEnd && !self.gameEnd){
        [self showGameEndAlert:collectionView];
        self.gameEnd = YES;
    }
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if(self.timer.lock==NO){
        self.score.clickCount++;
        NSInteger index=indexPath.item;
        BCVCell *cell = (BCVCell*)[collectionView cellForItemAtIndexPath:indexPath];
        [UIView transitionWithView:cell.content duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [cell setCard:self.game.deck[index]];
            [cell setForwardProperties];
        } completion:^(BOOL finished) {
            if([self.game makeTaskAtIndex:index :TableOptionEnable]){ //до того как их закроет getGameState
                NSInteger same = [self.game getFirstSameStateCardNumberWithNotEqualNumber:index];
                NSArray *info = @[[NSNumber numberWithInteger:indexPath.item], [NSNumber numberWithInteger:same]];
                switch([self.game getGameState]){
                    case GameStateFalse:{
                        self.timer = [CTimer createTimerWithInterval:1.0f target:self selector:@selector(updateTimer:) userInfo:info repeats:YES lock:YES];
                    }break;
                    case GameStateEnd:
                        [self.score setTimerPause];
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
        }];
    }
}
- (void) updateTimer:(NSTimer*)timer{
    NSLog(@"Timer Begin");
    NSNumber *first = timer.userInfo[0];
    NSNumber *second = timer.userInfo[1];
    NSIndexPath *index= [NSIndexPath indexPathForItem:[first integerValue] inSection:0];
    NSIndexPath *sameIndex = [NSIndexPath indexPathForItem:[second integerValue] inSection:0];
    BCVCell *cell = (BCVCell*)[self.cView cellForItemAtIndexPath:index];
    BCVCell *sameCell = (BCVCell*)[self.cView cellForItemAtIndexPath:sameIndex];
    if(cell.labelFirstSuit.hidden==NO){
        [UIView transitionWithView:cell.content duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [cell setBackProperties];
        } completion:^(BOOL finished) {
            [UIView transitionWithView:sameCell.content duration:0.4 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
                [sameCell setBackProperties];
            } completion:^(BOOL finished) {
                //[self.cView reloadData];
                [timer invalidate];
                self.timer.lock=NO;
                NSLog(@"End Timer");
            }];
        }];
    }
    else{
        [UIView transitionWithView:cell.content duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [cell setForwardProperties];
        } completion:^(BOOL finished) {
        }];
    }
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"TableOfResult"]){
       
    }
}
@end
