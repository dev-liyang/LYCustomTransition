//
//  LYNavImitateKuGouPushAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavKuGouPushAnimator.h"

@implementation LYNavKuGouPushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //动画 仿射变换动画
    float centerX = toView.bounds.size.width * 0.5;
    float centerY = toView.bounds.size.height * 0.5;
    float x = toView.bounds.size.width * 0.5;
    float y = toView.bounds.size.height * 1.8;
    
    //起始位置: 原始位置绕x,y旋转45º后的位置
    CGAffineTransform trans = [self GetCGAffineTransformRotateAroundCenterX:centerX centerY:centerY x:x y:y angle:45.0/180.0*M_PI];
    toView.transform = trans;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        //终止位置: 原始位置
        toView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
                
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
}

/**
 仿射变换
 
 @param centerX     view的中心点X坐标
 @param centerY     view的中心点Y坐标
 @param x           旋转中心x坐标
 @param y           旋转中心y坐标
 @param angle       旋转的角度
 @return            CGAffineTransform对象
 */
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


