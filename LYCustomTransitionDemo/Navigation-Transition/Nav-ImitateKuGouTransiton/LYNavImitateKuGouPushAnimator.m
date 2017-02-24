//
//  LYNavImitateKuGouPushAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavImitateKuGouPushAnimator.h"

@implementation LYNavImitateKuGouPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    
    //动画 仿射变换动画
    float centerX = toView.bounds.size.width * 0.5;
    float centerY = toView.bounds.size.height * 0.5;
    float x = toView.bounds.size.width * 0.5;
    float y = toView.bounds.size.height * 1.8;
    CGAffineTransform trans = [self GetCGAffineTransformRotateAroundCenterX:centerX centerY:centerY x:x y:y angle:45.0/180.0*M_PI];
    
    toView.transform = CGAffineTransformIdentity;
    toView.transform = trans;
    
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        CGAffineTransform trans = [self GetCGAffineTransformRotateAroundCenterX:centerX centerY:centerY x:x y:y angle:0/180.0*M_PI];
        
        toView.transform = CGAffineTransformIdentity;
        toView.transform = trans;
        
        bgView.alpha = 1;
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        
        [fromView removeFromSuperview];
        [bgView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
}

- (CGAffineTransform)GetCGAffineTransformRotateAroundCenterX:(float)centerX centerY:(float)centerY x:(float)x y:(float)y angle:(float)angle{
    
    CGFloat l = y - centerY;
    CGFloat h = l * sin(angle);
    CGFloat b = l * cos(angle);
    CGFloat a = l - b;
    CGFloat x1 = h;
    CGFloat y1 = a;
    
    CGAffineTransform  trans = CGAffineTransformMakeTranslation(x1, y1);
    trans = CGAffineTransformRotate(trans,angle);
    
    return trans;
}
@end


