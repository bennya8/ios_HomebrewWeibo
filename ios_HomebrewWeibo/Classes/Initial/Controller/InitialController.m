//
//  InitialController.m
//  ios_HomebrewWeibo
//
//  Created by Benny on 9/12/14.
//  Copyright (c) 2014 Benny. All rights reserved.
//

#import "InitialController.h"
#import "AuthController.h"
#import "MainController.h"
#import "Account.h"

#define kInitialPageCount 4

@interface InitialController () <UIScrollViewDelegate>
{
    UIScrollView *_scrollView;
    
    UIPageControl *_pageControl;
}
@end

@implementation InitialController

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
    
    [self addScrollView];
    
    [self addImageView];
    
    [self addPageControl];
}

#pragma mark - 初始化控件
- (void)addScrollView
{
    CGSize size = self.view.bounds.size;
    _scrollView = [[UIScrollView alloc]initWithFrame:self.view.frame];
    _scrollView.contentSize = CGSizeMake(size.width * kInitialPageCount, 0);
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    [self.view addSubview:_scrollView];
}

- (void)addImageView
{
    CGSize size = _scrollView.bounds.size;
    for (NSInteger i = 0; i < kInitialPageCount; i++) {
        UIView *pageView = [[UIView alloc]initWithFrame:CGRectMake(i*size.width,0,size.width,size.height)];
        
        NSString *imageName = [NSString stringWithFormat:@"initial_page_%d",(int)i+1];
        UIImage *image =[UIImage imageNamed:imageName];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
        imageView.center = CGPointMake(pageView.bounds.size.width * 0.5, 180);
        imageView.contentMode = UIViewContentModeCenter;
        
        if (i == 0) {
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"分享发现人们身边\n的趣闻轶事";
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 4;
            label.font = [UIFont fontWithName:kAppFont size:28];
            label.frame = CGRectMake(0, 0, size.width - 60, 100);
            label.center = CGPointMake(size.width * 0.5, 360);
            [pageView addSubview:label];
        } else if (i == 1) {
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"涵盖最全面的娱乐\n明星与资讯";
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 4;
            label.font = [UIFont fontWithName:kAppFont size:28];
            label.frame = CGRectMake(0, 0, size.width - 60, 100);
            label.center = CGPointMake(size.width * 0.5, 360);
            [pageView addSubview:label];
        } else if (i == 2) {
            UILabel *label = [[UILabel alloc]init];
            label.textAlignment = NSTextAlignmentCenter;
            label.text = @"反映网民现实生活\n的点点滴滴";
            label.textColor = [UIColor whiteColor];
            label.numberOfLines = 4;
            label.font = [UIFont fontWithName:kAppFont size:28];
            label.frame = CGRectMake(0, 0, size.width - 60, 100);
            label.center = CGPointMake(size.width * 0.5, 360);
            [pageView addSubview:label];
        } else if (i == 3) {
            UIImage *normalImage = [UIImage imageNamed:@"initial_button_normal"];
            UIImage *selectImage = [UIImage imageNamed:@"initial_button_selected"];
            
            UIButton *button = [[UIButton alloc]init];
            button.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
            button.center = CGPointMake(size.width * 0.5, 370);
            button.titleLabel.font =  [UIFont fontWithName:kAppFont size:20];
            [button setTitle:@"开始寻找更多乐趣" forState:UIControlStateNormal];
            
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setBackgroundImage:normalImage forState:UIControlStateNormal];
            
             /* #1d6ef1 */
            [button setTitleColor:kAppColorLightBlue forState:UIControlStateHighlighted];
            [button setBackgroundImage:selectImage forState:UIControlStateHighlighted];
            
            [button addTarget:self action:@selector(touchStartButton:) forControlEvents:UIControlEventTouchUpInside];
            [pageView addSubview:button];

        }
        
        [pageView addSubview:imageView];
        [_scrollView addSubview:pageView];
    }
}

- (void)addPageControl
{
    CGSize size = self.view.bounds.size;
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = kInitialPageCount;
    _pageControl.frame = CGRectMake(0, 0, size.width, 30);
    _pageControl.center = CGPointMake(size.width * 0.5, size.height * 0.95);
    _pageControl.userInteractionEnabled = NO;
    [self.view addSubview:_pageControl];
}

#pragma mark - 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSInteger currentPage = scrollView.contentOffset.x / scrollView.bounds.size.width;
    _pageControl.currentPage = currentPage;
}

#pragma mark - 事件
- (void)touchStartButton:(UIButton *)sender
{
    Account *account = [[Account sharedAccount]unserializeAccount];
    if (account.access_token == nil) {
        [self.view.window setRootViewController:[[AuthController alloc]init]];
    } else {
        [self.view.window setRootViewController:[[MainController alloc] init]];
    }
}

@end
