//
//  Account.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Account : NSObject

@property (strong, nonatomic) NSString *access_token;

@property (assign, nonatomic) NSInteger expires_in;

@property (assign, nonatomic) NSInteger remind_in;

@property (assign, nonatomic) NSInteger uid;

+ (id)sharedAccount;

- (void)serializeAccount;

- (Account *)unserializeAccount;

@end
