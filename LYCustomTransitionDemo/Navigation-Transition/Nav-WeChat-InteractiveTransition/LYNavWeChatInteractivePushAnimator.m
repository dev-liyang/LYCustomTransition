//
//  LYNavWeChatInteractivePushAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavWeChatInteractivePushAnimator.h"

@implementation LYNavWeChatInteractivePushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.5;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    [containerView addSubview:fromView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    toView.hidden = YES;
    
    //图片背景的空白view (设置和控制器的背景颜色一样，给人一种图片被调走的假象 [可以换种颜色看看效果])
    UIView *imgBgWhiteView = [[UIView alloc] initWithFrame:self.transitionBeforeImgFrame];
    imgBgWhiteView.backgroundColor = bgColor;
    [containerView addSubview:imgBgWhiteView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    //过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.transitionImgView.image];
    transitionImgView.frame = self.transitionBeforeImgFrame;
    [transitionContext.containerView addSubview:transitionImgView];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0.0 usingSpringWithDamping:0.7 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveLinear animations:^{
        
        transitionImgView.frame = self.transitionAfterImgFrame;
        bgView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        toView.hidden = NO;
        
        [imgBgWhiteView removeFromSuperview];
        [bgView removeFromSuperview];
        [transitionImgView removeFromSuperview];
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
    
}

@end


