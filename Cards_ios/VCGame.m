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
    cell.labelSuit.text = [NSString stringWithFormat:@"%d",cell.card.suit];
    cell.labelValue.text = [NSString stringWithFormat:@"%d",cell.card.value];
    cell.labelSuit.hidden=NO;
    
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
