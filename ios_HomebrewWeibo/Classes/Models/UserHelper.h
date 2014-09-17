//
//  UserHelper.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/15/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class User;

@interface UserHelper : NSObject

#pragma mark - 根据用户ID获取用户信息
+ (void)fetchUserByUid:(NSInteger)uid complete:(void(^)(User *user))complete;

@end
