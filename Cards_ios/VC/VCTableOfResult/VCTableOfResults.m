//
//  VCTableOfResults.m
//  Cards_ios
//
//  Created by Георгий Зубков on 11/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define NUMBER_OF_SECTIONS 1
#define NUMBER_OF_TEST_ROWS 10

typedef enum{
    SegmentValueAll = 0,
    SegmentValueEasy,
    SegmentValueMiddle,
    SegmentValueHard
}SegmentValue;


#import "VCTableOfResults.h"
#import "TVCell.h"
#import "User.h"
#import "CVAlert.h"


@interface VCTableOfResults ()
@property NSString *cellID;
@property NSUserDefaults *defaults;
@property NSArray *players;
@property NSArray *hard;
@property NSArray *middle;
@property NSArray *easy;
@end

@implementation VCTableOfResults

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cellID = @"TVCell_ID";
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithTitle:@"Меню" style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonTap:)];
    self.navigationItem.rightBarButtonItem = item;
    UINib *nib = [UINib nibWithNibName:@"TVCell" bundle:nil];
    [self.table registerNib:nib forCellReuseIdentifier:self.cellID];
    [self setUserDefaults];
    [self setSegmentController];
}
- (void) setSegmentController{
    self.segment.backgroundColor = [UIColor whiteColor];
    [self.segment insertSegmentWithTitle:@"Средний" atIndex:SegmentValueMiddle animated:YES];
    [self.segment insertSegmentWithTitle:@"Тяжелый" atIndex:SegmentValueHard animated:YES];
    [self.segment setTitle:@"Все" forSegmentAtIndex:SegmentValueAll];
    [self.segment setTitle:@"Легкий" forSegmentAtIndex:SegmentValueEasy];
}
- (void) setUserDefaults{ //попробовать nspredicate
    self.defaults = [NSUserDefaults standardUserDefaults];
    NSArray *players = [self.defaults objectForKey:USERS_ARR_KEY];
    NSMutableArray *h = [[NSMutableArray alloc]init];
    NSMutableArray *m = [[NSMutableArray alloc]init];
    NSMutableArray *e = [[NSMutableArray alloc]init];
    NSMutableArray *all = [[NSMutableArray alloc]init];
    for(int i = 0; i < players.count; i++){
        User *user = [NSKeyedUnarchiver unarchiveObjectWithData:players[i]];
        [all addObject:user];
        switch(user.mode){
            case GameModeEasy:
                [e addObject:user];
                break;
            case GameModeMiddle:
                [m addObject:user];
                break;
            case GameModeHard:
                [h addObject:user];
                break;
        }
    }
    self.players = all;
    self.hard = h;
    self.middle = m;
    self.easy = e;
}
- (IBAction)valueChenged:(id)sender {
    [self.table reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch(self.segment.selectedSegmentIndex){
        case SegmentValueEasy:
            return self.easy.count;
            break;
        case SegmentValueMiddle:
            return self.middle.count;
            break;
        case SegmentValueHard:
            return self.hard.count;
            break;
    }
    return self.players.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger index = indexPath.row;
    User *user;
    switch(self.segment.selectedSegmentIndex){
        case SegmentValueEasy:
            user = self.easy[index];
            break;
        case SegmentValueMiddle:
            user = self.middle[index];
            break;
        case SegmentValueHard:
            user = self.hard[index];
            break;
        case SegmentValueAll:
            user = self.players[index];
            break;
    }
    TVCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellID];
    cell.name.text = user.name;
    cell.position.text = [NSString stringWithFormat:@"%ld", index + 1];
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
            default:
            cell.view.backgroundColor = [UIColor grayColor];
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
- (void) logOfTable{
    for(int i=0;i<self.players.count;i++) {
        User *user = [NSKeyedUnarchiver unarchiveObjectWithData:self.players[i]];
        NSLog(@"%@",user.name);
    }
    NSLog(@"");
}
- (void) rightButtonTap:(id)sender{
    CVAlert *alert = [CVAlert createAlertWithTitle:@"Меню" message:@"Выберите действие"];
    [alert addButton:@"Отчистить таблицу" action:^{
        [self deleteUserDefaults];
    }];
    [alert addButton:@"Лог талицы" action:^{
        [self logOfTable];
    }];
    [alert addButton:@"OK" action:nil];
    [alert show:YES view:self];
    //[self performSegueWithIdentifier:@"Main" sender:sender];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
