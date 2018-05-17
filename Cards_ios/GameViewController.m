//
//  GameViewController.m
//  Cards_ios
//
//  Created by Георгий Зубков on 14.05.2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#define CVIEW_IDENTIFIER 100
#define CELL_IDENTIFIER 101
#define LABEL_IDENTIFIER 102
#import "GameViewController.h"

@interface GameViewController ()
@end

@implementation GameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Cards *cards=[Cards sharedInstance];
    CGRect screen=[[UIScreen mainScreen]bounds];
    _screenWidth=CGRectGetWidth(screen);
    _screenHeight=CGRectGetHeight(screen);
    _cardWidth=_screenWidth/[[Cards sharedInstance]height];
    _cardHeight=_screenHeight/([cards cardDeckNumber]/[cards height]);
    //[self.cView setDataSource:self];
    //[self.cView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSInteger count=[[[Cards sharedInstance] map]count];
    return count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell_ID";
    
    UICollectionViewCell *cell = [self.cView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *label=(UILabel*)[cell viewWithTag:LABEL_IDENTIFIER];
    [label setText:@"HELLO!"];
    // recipeImageView.image = [UIImage imageNamed:[recipeImages objectAtIndex:indexPath.row]];
    
    return cell;
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
