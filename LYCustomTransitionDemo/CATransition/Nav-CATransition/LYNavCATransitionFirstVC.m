//
//  LYNavCATransitionFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavCATransitionFirstVC.h"
#import "LYNavCATransitionSecondVC.h"
@interface LYNavCATransitionFirstVC ()

@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYNavCATransitionFirstVC
    
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.navigationController.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Nav-CATransition";
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
    
    LYNavCATransitionSecondVC *second = [[LYNavCATransitionSecondVC alloc] init];
    [self.navigationController.view.layer addAnimation:[self pushAnimation] forKey:nil];//添加Animation
    [self.navigationController pushViewController:second animated:NO];  //记得这里的animated要设为NO，不然会重复
}
- (CATransition *)pushAnimation{
    
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
    
    transition.type = @"cube";
//    transition.type = kCATransitionMoveIn;
    
    //下面四个是系统共有的API
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromRight;
    //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    return transition;
}

@end
