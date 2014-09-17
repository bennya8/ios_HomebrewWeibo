//
//  Status.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/16/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Geo;
@class User;
@class Status;

@interface Status : NSObject

@property (copy, nonatomic) NSString *created_at; // 微博创建时间
@property (assign, nonatomic) long long ID; // 微博ID
@property (assign, nonatomic) long long mid; // 微博MID
@property (copy, nonatomic) NSString *idstr; // 字符串型的微博ID
@property (copy, nonatomic) NSString *text; // 微博信息内容
@property (copy, nonatomic) NSString *source; // 微博来源
@property (assign, nonatomic) BOOL favorited; // 是否已收藏
@property (assign, nonatomic) BOOL truncated; // 是否被截断
@property (copy, nonatomic) NSString *in_reply_to_status_id; //（暂未支持）回复ID
@property (copy, nonatomic) NSString *in_reply_to_user_id; //（暂未支持）回复人UID
@property (copy, nonatomic) NSString *in_reply_to_screen_name; //（暂未支持）回复人昵称
@property (copy, nonatomic) NSString *thumbnail_pic; // 缩略图片地址，没有时不返回此字段
@property (copy, nonatomic) NSString *bmiddle_pic; // 中等尺寸图片地址，没有时不返回此字段
@property (copy, nonatomic) NSString *original_pic; // 原始图片地址，没有时不返回此字段
@property (strong, nonatomic) Geo *geo; // 地理信息字段
@property (strong, nonatomic) User *user; // 微博作者的用户信息字段
@property (strong, nonatomic) Status *retweeted_status; // 被转发的原微博信息字段，当该微博为转发微博时返回
@property (assign, nonatomic) NSInteger reposts_count; // 转发数
@property (assign, nonatomic) NSInteger comments_count; // 评论数
@property (assign, nonatomic) NSInteger attitudes_count; // 表态数
@property (assign, nonatomic) NSInteger mlevel; // 暂未支持

- (id)initWithDict:(NSDictionary *)dict;

@end
