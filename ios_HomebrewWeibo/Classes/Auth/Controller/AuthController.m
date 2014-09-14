//
//  InitialAuthController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/12/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "AuthController.h"
#import "AuthWeiboController.h"
#import "Account.h"

@interface AuthController () <AuthWeiboControllerDelegate>

@end

@implementation AuthController

- (void)loadView
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:[UIScreen mainScreen].applicationFrame];
    [imageView setImage:[UIImage fullscreenImageNamed:@"initial_background.png"]];
    [imageView setUserInteractionEnabled:YES];
    self.view = imageView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addTitleContent];
    
    [self addAuthButton];
    
    
    
    Account *account = [[Account sharedAccount]unserializeAccount];
    NSLog(@"%@",account);
}

#pragma mark - 初始化组件
- (void)addTitleContent
{
    CGSize size = self.view.bounds.size;
    UILabel *label = [[UILabel alloc]init];
    label.text = @"账号登陆";
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:kAppFont size:40];
    label.frame = CGRectMake(0, 100, size.width, 50);
    [self.view addSubview:label];
        
    UILabel *label2 = [[UILabel alloc]init];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.text = @"授权应用 Weibot 访问你的微博账号";
    label2.backgroundColor = [UIColor clearColor];
    label2.textColor = [UIColor whiteColor];
    label2.numberOfLines = 4;
    label2.font = [UIFont fontWithName:kAppFont size:16];
    label2.frame = CGRectMake(0, 0, size.width - 60, 78);
    label2.center = CGPointMake(size.width * 0.5, 220);
    [self.view addSubview:label2];
}

- (void)addAuthButton
{
    CGSize size = self.view.bounds.size;
    UIImage *normalImage = [UIImage imageNamed:@"initial_button_normal"];
    UIImage *selectImage = [UIImage imageNamed:@"initial_button_selected"];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    button.center = CGPointMake(size.width * 0.5, 370);
    button.titleLabel.font =  [UIFont fontWithName:kAppFont size:20];
    [button setTitle:@"授权登陆" forState:UIControlStateNormal];
    
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    /* #1d6ef1 */
    [button setTitleColor:[UIColor colorWithRed:0.114 green:0.431 blue:0.945 alpha:1] forState:UIControlStateHighlighted];
    [button setBackgroundImage:selectImage forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(touchAuthButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - 事件
- (void)touchAuthButton:(UIButton *)sender
{
    
//    [HttpHelper sendGetRequestWithUrl:@"http://mrobot.pconline.com.cn/v2/cms/channels/1" params:nil complete:^(id data, NSURLResponse *response, NSError *error) {
//        if (!error) {
//            
//        }
//    }];

    AuthWeiboController *authWeibo = [[AuthWeiboController alloc]init];
    authWeibo.authWeibodelegate = self;
    [self presentViewController:authWeibo animated:YES completion:nil];
    
}

- (void)authWeiboDidSuccess:(AuthWeiboController *)controller data:(NSData *)data response:(NSURLResponse *)response
{
    Account *account = [Account sharedAccount];
    [account setValuesForKeysWithDictionary:(NSDictionary *)data];
    [account serializeAccount];
    [controller dismissViewControllerAnimated:YES completion:^{
        
    }];
}

- (void)authWeiboDidFail:(AuthWeiboController *)controller error:(NSError *)error response:(NSURLResponse *)response
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"授权失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

@end
