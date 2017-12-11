//
//  LYModalCATransitionSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/21.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalCATransitionSecondVC.h"

@interface LYModalCATransitionSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation LYModalCATransitionSecondVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second";
    self.view.backgroundColor = [UIColor blackColor];
    self.view.layer.masksToBounds = YES;
    
    UIImage *image = [UIImage imageNamed:@"CATransition"];
    CGSize size = [self backImageSize:image];
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - size.height) * 0.5, size.width, size.height)];
    _imgView.image = image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 44, 44)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
}

- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}

- (void)backBtnClick:(UIButton *)sender{
    if (self.navigationController.viewControllers.count > 1) {
        
        [self.navigationController.view.layer addAnimation:[self popAnimation] forKey:nil];
        [self.navigationController popViewControllerAnimated:NO];
    }else{
        
        [self.view.window.layer addAnimation:[self popAnimation] forKey:nil];
        [self dismissViewControllerAnimated:NO completion:nil];
    }
}
- (CATransition *)popAnimation{
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    /*
     cube                   立方体效果
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect           水滴波动效果
     suckEffect             变成小布块飞走的感觉
     oglFlip                上下翻转
     cameraIrisHollowClose  相机镜头关闭效果
     cameraIrisHollowOpen   相机镜头打开效果
     */
    
//    transition.type = @"pageUnCurl";
    transition.type = kCATransitionPush;
    
    //下面四个是系统列举出来的常见的类型
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromLeft;
    //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    return transition;
}

@end

