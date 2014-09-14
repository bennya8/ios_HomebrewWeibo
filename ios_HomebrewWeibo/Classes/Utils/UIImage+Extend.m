//
//  UIImage+Extend.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/12/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "UIImage+Extend.h"

@implementation UIImage (Extend)

#pragma 自动加载设备自适应图片
+ (UIImage *)fullscreenImageNamed:(NSString *)name
{
    NSString *ext = [name pathExtension];
    name = [name stringByDeletingPathExtension];
    if ([UIScreen mainScreen].bounds.size.height == 568) {
        name = [name stringByAppendingString:@"-568h"];
    }
    name = [name stringByAppendingPathExtension:ext];
    return [self imageNamed:name];
}

@end
