//
//  AuthWeiboController.h
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/13/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AuthWeiboController;

@protocol AuthWeiboControllerDelegate <NSObject>

- (void)authWeiboDidSuccess:(AuthWeiboController *)controller data:(NSData *)data response:(NSURLResponse *)response;

- (void)authWeiboDidFail:(AuthWeiboController *)controller error:(NSError *)error response:(NSURLResponse *)response;

@end

@interface AuthWeiboController : UIViewController

@property (weak, nonatomic) id<AuthWeiboControllerDelegate> authWeibodelegate;

@end
