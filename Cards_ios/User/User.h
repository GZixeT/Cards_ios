//
//  User.h
//  Cards_ios
//
//  Created by Георгий Зубков on 12/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//
#define NAME_KEY @"name"
#define SCORE_KEY @"score"
#define INDEX_KEY @"index"
#define MODE_KEY @"mode"

#import <Foundation/Foundation.h>


@interface User : NSObject <NSCoding>
@property (nonatomic) NSString *name;
@property (nonatomic) NSInteger score;
@property (nonatomic) NSInteger index;
@property (nonatomic) NSInteger mode;
+ (id) createUserWithName:(NSString*)name score:(NSInteger)score mode:(NSInteger)mode;
@end
