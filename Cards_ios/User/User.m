//
//  User.m
//  Cards_ios
//
//  Created by Георгий Зубков on 12/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "User.h"

@implementation User
+ (id) createUserWithName:(NSString*)name score:(NSInteger)score index:(NSInteger)index{
    User *user = [[User alloc]init];
    user.name = name;
    user.score = score;
    user.index = index;
    return user;
}
@end
