//
//  VCTableOfResults.m
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "VCTableOfResults.h"
#import "TVCell.h"

@interface VCTableOfResults ()
@property NSString *cellID;
@property NSUserDefaults *defaults;
@property NSString *key;
@end

@implementation VCTableOfResults

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellID = @"TVCell_ID";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Menu" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    //self.navigationController.navigationItem.rightBarButtonItem=item;
    self.navigationItem.rightBarButtonItem = item;
    UINib *nib = [UINib nibWithNibName:@"TVCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:self.cellID];
    [self setUserDefaults];
}
- (void) setUserDefaults{
    self.defaults = [NSUserDefaults standardUserDefaults];
    self.key=@"name";
    [self.defaults setObject:@1 forKey:self.key];
    [self.defaults setObject:@2 forKey:self.key];
    [self.defaults synchronize];
    //[defaults objectForKey:key];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
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
