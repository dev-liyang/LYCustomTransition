//
//  LYModalCATransitionFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalCATransitionFirstVC.h"
#import "LYModalCATransitionSecondVC.h"

@interface LYModalCATransitionFirstVC ()
@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation LYModalCATransitionFirstVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Modal-CATransition";
    self.view.backgroundColor = bgColor;
    self.view.layer.masksToBounds = YES;
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 120, 120)];
    _imgView.center = self.view.center;
    _imgView.image = [UIImage imageNamed:@"CATransition"];
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)pushSecond{
    
    LYModalCATransitionSecondVC *second = [[LYModalCATransitionSecondVC alloc] init];
    [self.view.window.layer addAnimation:[self presentAnimation] forKey:nil];//添加Animation
    [self presentViewController:second animated:NO completion:nil];  //记得这里的animated要设为NO，不然会重复
}
- (CATransition *)presentAnimation{
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    /*私有API
     cube                   立方体效果
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect           水滴波动效果
     suckEffect             变成小布块飞走的感觉
     oglFlip                上下翻转
     cameraIrisHollowClose  相机镜头关闭效果
     cameraIrisHollowOpen   相机镜头打开效果
     */
    
//    transition.type = @"cube";
    transition.type = kCATransitionPush;
    
    //下面四个是系统共有的API
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromRight;
    //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    return transition;
}

@end

