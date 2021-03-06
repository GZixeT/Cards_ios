//
//  User.m
//  Cards_ios
//
//  Created by Георгий Зубков on 12/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import "User.h"

@implementation User
+ (id) createUserWithName:(NSString*)name score:(NSInteger)score mode:(NSInteger)mode{
    User *user = [[User alloc]init];
    user.name = name;
    user.score = score;
    user.index = 0;
    user.mode = mode;
    return user;
}
- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.name = [decoder decodeObjectForKey:NAME_KEY];
        self.score = [decoder decodeIntegerForKey:SCORE_KEY];
        self.index = [decoder decodeIntegerForKey:INDEX_KEY];
        self.mode = [decoder decodeIntegerForKey:MODE_KEY];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.name forKey:NAME_KEY];
    [encoder encodeInteger:self.score forKey:SCORE_KEY];
    [encoder encodeInteger:self.index forKey:INDEX_KEY];
    [encoder encodeInteger:self.mode forKey:MODE_KEY];
}

@end
