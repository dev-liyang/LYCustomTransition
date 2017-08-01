//
//  LYNavBaseInteractiveVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/27.
//  Copyright © 2017年 liyang. All rights reserved.
//


#import "LYNavBaseInteractiveVC.h"
#import "LYNavBaseInteractiveSecondVC.h"
#import "LYNavBaseInteractiveAnimatedTransition.h"

@interface LYNavBaseInteractiveVC ()

@property (nonatomic, strong) LYNavBaseInteractiveAnimatedTransition *animatedTransition;

@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYNavBaseInteractiveVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = nil;
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
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)pushSecond{
    
    //1. 设置代理
    self.navigationController.delegate = self.animatedTransition;
    
    //2.push跳转
    LYNavBaseInteractiveSecondVC *second = [[LYNavBaseInteractiveSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (LYNavBaseInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYNavBaseInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}


@end

