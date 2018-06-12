//
//  VCTableOfResults.m
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_TEST_ROWS 10

#import "VCTableOfResults.h"
#import "TVCell.h"

@interface VCTableOfResults ()
@property NSString *cellID;
@property NSUserDefaults *defaults;
@end

@implementation VCTableOfResults

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellID = @"TVCell_ID";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    self.navigationItem.rightBarButtonItem = item;
    UINib *nib = [UINib nibWithNibName:@"TVCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:self.cellID];
    [self setUserDefaults];
}
- (void) setUserDefaults{
    self.defaults = [NSUserDefaults standardUserDefaults];
    //NSData *data = [self.defaults objectForKey:@"User"];
    //[self.defaults setObject:@1 forKey:@"name"];
    //[self.defaults setObject:@2 forKey:@"name2"];
    //[self.defaults synchronize];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return NUMBER_OF_TEST_ROWS;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TVCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellID];
    tableView.rowHeight = UITableViewAutomaticDimension;
    return cell;
}
- (void) deleteUserDefaults{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}
- (void) rightButtonTap:(id)sender{
    //[self performSegueWithIdentifier:@"Main" sender:sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
