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
#import "User.h"
#import "CVAlert.h"

#define USER_KEY @"User"
#define USERS_ARR_KEY @"Users"

@interface VCTableOfResults ()
@property NSString *cellID;
@property NSUserDefaults *defaults;
@property NSArray *players;
@end

@implementation VCTableOfResults

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellID = @"TVCell_ID";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Delete" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    self.navigationItem.rightBarButtonItem = item;
    UINib *nib = [UINib nibWithNibName:@"TVCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:self.cellID];
    [self setUserDefaults];
}
- (void) setUserDefaults{//здесь добавляется новый элемент в список
    self.defaults = [NSUserDefaults standardUserDefaults];
    NSData *data = [self.defaults objectForKey:USER_KEY]; // вот это подет в новый массив
    NSArray *old = [self.defaults objectForKey:USERS_ARR_KEY];//NSArray из Data
    if(data){
        NSMutableArray *nArr = [NSMutableArray arrayWithArray:old];
        [nArr addObject:data];
        [self.defaults setObject:nArr forKey:USERS_ARR_KEY];
        [self.defaults removeObjectForKey:USER_KEY];
        [self.defaults synchronize];
    }
    self.players =[self.defaults objectForKey:USERS_ARR_KEY];
    for(int i=0;i<self.players.count;i++) {
        User *user = [NSKeyedUnarchiver unarchiveObjectWithData:self.players[i]];
        NSLog(@"%@",user.name);
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.players.count;
}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 100;
//}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    NSData *data = self.players[index];
    User *user = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    TVCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellID];
    cell.name.text = user.name;
    cell.position.text = [NSString stringWithFormat:@"%ld", user.index];
    cell.score.text = [NSString stringWithFormat:@"%ld", user.score];
    tableView.rowHeight = UITableViewAutomaticDimension;
    switch(index){
        case 0:
            [cell setSystemBoldFontWithSize:22];
            cell.view.backgroundColor = [UIColor redColor];
            break;
        case 1:
            [cell setSystemBoldFontWithSize:20];
            cell.view.backgroundColor = [UIColor yellowColor];
            break;
        case 2:
            [cell setSystemBoldFontWithSize:18];
            cell.view.backgroundColor = [UIColor greenColor];
            break;
    }
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
    CVAlert *alert = [CVAlert createAlertWithTitle:@"Внимание" message:@"Отчистить таблицу?"];
    [alert addButton:@"Да" action:^{
        [self deleteUserDefaults];
    }];
    [alert addButton:@"Нет" action:^{}];
    [alert show:YES view:self];
    //[self performSegueWithIdentifier:@"Main" sender:sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
