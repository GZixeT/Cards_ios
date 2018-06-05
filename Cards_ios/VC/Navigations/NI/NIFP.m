//
//  NIFP.m
//  Cards_ios
//
//  Created by Георгий Зубков on 05/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "NIFP.h"

@implementation NIFP
- (void) awakeFromNib
{
    [super awakeFromNib];
    //NSMutableArray *buttons=[[NSMutableArray alloc]init];
    UIBarButtonItem *button=[[UIBarButtonItem alloc]initWithTitle:@"" style:self.backBarButtonItem.style target:self.backBarButtonItem.target action:self.backBarButtonItem.action];
    self.backBarButtonItem=button;
}
@end
