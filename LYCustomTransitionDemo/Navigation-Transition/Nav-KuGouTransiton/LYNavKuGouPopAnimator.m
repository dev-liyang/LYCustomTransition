//
//  LYNavImitateKuGouPopAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavKuGouPopAnimator.h"

@implementation LYNavKuGouPopAnimator

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
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    //动画 1 组合动画(效果没有仿射变换动画效果好,组合动画的旋转和移动好像不是异步执行的)
    /*
    //路径
    UIBezierPath *path = [[UIBezierPath alloc] init];
    [path addArcWithCenter:CGPointMake(kScreenWidth * 0.5, kScreenHeight * 2) radius:kScreenHeight * 1.5 startAngle:M_PI * 1.5 endAngle:M_PI * 2 clockwise:YES];
    
    //路径动画
    CAKeyframeAnimation *anima1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    anima1.path = path.CGPath;
    //旋转动画
    CABasicAnimation *anima3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    anima3.toValue = [NSNumber numberWithFloat: 90/180.0 * M_PI];
    //组动画
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = [NSArray arrayWithObjects:anima1,anima3, nil];
    groupAnimation.duration = [self transitionDuration:transitionContext] * 2;
    
    //添加组动画
    [fromView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
    */
    
    
    //动画 2 仿射变换动画
    float centerX = fromView.bounds.size.width * 0.5;
    float centerY = fromView.bounds.size.height * 0.5;
    float x = fromView.bounds.size.width * 0.5;
    float y = fromView.bounds.size.height * 1.8;
    
    //起始位置: 原始位置
    fromView.transform = CGAffineTransformIdentity;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        //终止位置: 原始位置绕x,y旋转45º后的位置
        CGAffineTransform transf = [self GetCGAffineTransformRotateAroundCenterX:centerX centerY:centerY x:x y:y angle:35.0/180.0*M_PI];
        
        fromView.transform = transf;
        
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        
        if (!wasCancelled) {
            
            [fromView removeFromSuperview];
        }
        
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

