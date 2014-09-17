//
//  Geo.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/16/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Geo : NSObject

@property (copy, nonatomic) NSString *longitude; // 经度坐标
@property (copy, nonatomic) NSString *latitude; // 维度坐标
@property (copy, nonatomic) NSString *city; // 所在城市的城市代码
@property (copy, nonatomic) NSString *province; // 所在省份的省份代码
@property (copy, nonatomic) NSString *city_name; // 所在城市的城市名称
@property (copy, nonatomic) NSString *province_name; // 所在省份的省份名称
@property (copy, nonatomic) NSString *address; // 所在的实际地址，可以为空
@property (copy, nonatomic) NSString *pinyin; // 地址的汉语拼音，不是所有情况都会返回该字段
@property (copy, nonatomic) NSString *more; // 更多信息，不是所有情况都会返回该字段

@end
