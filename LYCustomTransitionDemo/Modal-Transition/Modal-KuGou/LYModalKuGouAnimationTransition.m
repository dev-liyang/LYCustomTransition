//
//  LYModalKuGouAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalKuGouAnimationTransition.h"

#import "LYNavKuGouPushAnimator.h"
#import "LYNavKuGouPopAnimator.h"

@interface LYModalKuGouAnimationTransition ()


@property (nonatomic, strong) LYNavKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavKuGouPopAnimator  *customPop;

@end

@implementation LYModalKuGouAnimationTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPush;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPop;
}

- (LYNavKuGouPushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYNavKuGouPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavKuGouPopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYNavKuGouPopAnimator alloc] init];
    }
    return _customPop;
}


@end


