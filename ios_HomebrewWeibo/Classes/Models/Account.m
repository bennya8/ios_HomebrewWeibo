//
//  Account.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/14/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "Account.h"

static Account *_shareInstance;

@interface Account() <NSCoding>

@end

@implementation Account

+ (id)sharedAccount
{
    if (_shareInstance == nil) {
        _shareInstance = [[self alloc]init];
    }
    return _shareInstance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [super allocWithZone:zone];
    });
    return _shareInstance;
}

- (void)serializeAccount
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.bin"];
    [NSKeyedArchiver archiveRootObject:self toFile:path];
}

- (Account *)unserializeAccount
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0] stringByAppendingPathComponent:@"account.bin"];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:_access_token forKey:@"access_token"];
    [aCoder encodeInteger:_expires_in forKey:@"expires_in"];
    [aCoder encodeInteger:_remind_in forKey:@"remind_in"];
    [aCoder encodeInteger:_uid forKey:@"uid"];
};

- (id)initWithCoder:(NSCoder *)aDecoder
{
    _access_token = [aDecoder decodeObjectForKey:@"access_token"];
    _expires_in = [aDecoder decodeIntegerForKey:@"expires_in"];
    _remind_in = [aDecoder decodeIntegerForKey:@"remind_id"];
    _uid = [aDecoder decodeIntegerForKey:@"uid"];
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"{ \n \
        access_token : %@, \n \
        expires_in : %d, \n \
        remind_id : %d, \n \
        uid : %d \n \
    }",_access_token,(int)_expires_in,(int)_remind_in,(int)_uid];
}

@end
