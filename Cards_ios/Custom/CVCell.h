//
//  CollectionViewCell.h
//  Cards_ios
//
//  Created by Георгий Зубков on 17/05/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
@interface CVCell : UICollectionViewCell
@property(nonatomic) Card *card;
@property(nonatomic, weak) IBOutlet UILabel *labelValue;
@property(nonatomic, weak) IBOutlet UILabel *labelSuit;
- (void) setValueLabelText;
- (void) setSuitLabelText;
- (void) setBackProperties;
- (void) setForwardProperties;
@end
