//
//  LYModalBaseVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalBaseVC.h"
#import "LYModalBaseSecondVC.h"
#import "LYNavBaseCustomAnimator.h"

@interface LYModalBaseVC () <UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) LYNavBaseCustomAnimator *customAnimator;

@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYModalBaseVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Base";
    self.view.backgroundColor = bgColor;
    self.view.layer.masksToBounds = YES;
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _imgView.center = self.view.center;
    _imgView.image = [UIImage imageNamed:@"Base"];
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(presentSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)presentSecond{
    
    
    LYModalBaseSecondVC *second = [[LYModalBaseSecondVC alloc] init];
    
    //1. 设置代理
    second.transitioningDelegate = self;
    
    //2.跳转
    [self presentViewController:second animated:YES completion:nil];
}

#pragma mark - UIViewControllerTransitioningDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.customAnimator;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.customAnimator;
}


- (LYNavBaseCustomAnimator *)customAnimator
{
    if (_customAnimator == nil) {
        _customAnimator = [[LYNavBaseCustomAnimator alloc]init];
    }
    return _customAnimator;
}
@end

