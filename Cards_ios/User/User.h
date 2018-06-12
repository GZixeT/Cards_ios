//
//  User.h
//  Cards_ios
//
//  Created by Георгий Зубков on 12/06/2018.
//  Copyright © 2018 Георгий Зубков. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject
@property NSString *name;
@property NSInteger score;
@property NSInteger index;
+ (id) createUserWithName:(NSString*)name score:(NSInteger)score index:(NSInteger)index;
@end
