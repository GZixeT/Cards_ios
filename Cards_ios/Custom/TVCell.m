//
//  TVCell.m
//  Cards_ios
//
//  Created by Георгий Зубков on 12/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "TVCell.h"

@implementation TVCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}
- (void) setSystemBoldFontWithSize:(NSInteger)size{
    [self.name setFont:[UIFont boldSystemFontOfSize:size]];
    [self.position setFont:[UIFont boldSystemFontOfSize:size]];
    [self.score setFont:[UIFont boldSystemFontOfSize:size]];
}

@end
