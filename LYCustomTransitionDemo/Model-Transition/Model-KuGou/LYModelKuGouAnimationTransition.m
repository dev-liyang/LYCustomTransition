//
//  LYModelKuGouAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModelKuGouAnimationTransition.h"

#import "LYNavImitateKuGouPushAnimator.h"
#import "LYNavImitateKuGouPopAnimator.h"

@interface LYModelKuGouAnimationTransition ()


@property (nonatomic, strong) LYNavImitateKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavImitateKuGouPopAnimator  *customPop;

@end

@implementation LYModelKuGouAnimationTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPush;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPop;
}

- (LYNavImitateKuGouPushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYNavImitateKuGouPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavImitateKuGouPopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYNavImitateKuGouPopAnimator alloc] init];
    }
    return _customPop;
}


@end


