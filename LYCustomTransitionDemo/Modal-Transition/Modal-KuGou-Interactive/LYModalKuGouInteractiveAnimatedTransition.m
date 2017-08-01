//
//  LYModalKuGouInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalKuGouInteractiveAnimatedTransition.h"

#import "LYNavKuGouPushAnimator.h"
#import "LYNavKuGouPopAnimator.h"
#import "LYModalKuGouPercentDerivenInteractive.h"

@interface LYModalKuGouInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYNavKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavKuGouPopAnimator  *customPop;
@property (nonatomic, strong) LYModalKuGouPercentDerivenInteractive  *percentIntractive;


@end

@implementation LYModalKuGouInteractiveAnimatedTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPush;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPop;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.gestureRecognizer)
        return self.percentIntractive;
    else
        return nil;
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

- (LYModalKuGouPercentDerivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYModalKuGouPercentDerivenInteractive alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _percentIntractive;
    
}

@end


