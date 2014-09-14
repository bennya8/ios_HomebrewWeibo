//
//  UIImage+Extend.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/12/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extend)

#pragma 自动加载设备自适应图片
+ (UIImage *)fullscreenImageNamed:(NSString *)name;

@end
