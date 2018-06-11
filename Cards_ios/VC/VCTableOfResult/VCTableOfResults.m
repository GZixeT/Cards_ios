//
//  VCTableOfResults.m
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "VCTableOfResults.h"

@interface VCTableOfResults ()

@end

@implementation VCTableOfResults

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    //self.navigationController.navigationItem.rightBarButtonItem=item;
    self.navigationItem.rightBarButtonItem = item;
}
- (void) rightButtonTap:(id)sender{
    [self performSegueWithIdentifier:@"Main" sender:sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
