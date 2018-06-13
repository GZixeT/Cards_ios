//
//  VCTableOfResults.h
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define USERS_ARR_KEY @"Users"

#import <UIKit/UIKit.h>

@interface VCTableOfResults : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
