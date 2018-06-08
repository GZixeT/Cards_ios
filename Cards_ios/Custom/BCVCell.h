//
//  BCVCell.h
//  Cards_ios
//
//  Created by Георгий Зубков on 07/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
@interface BCVCell : UICollectionViewCell
@property(nonatomic) Card *card;
@property(nonatomic, weak) IBOutlet UILabel *labelValue;
@property(nonatomic, weak) IBOutlet UILabel *labelFirstSuit;
@property(nonatomic, weak) IBOutlet UILabel *labelSecondSuit;
- (void) setValueLabelText;
- (void) setSuitLabelText;
- (void) setBackProperties;
- (void) setForwardProperties;
@end
