//
//  LYPictureBrowsePushAnimator.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYPictureBrowsePushAnimator.h"
#import "LYPictureBrowseTransitionParameter.h"

@implementation LYPictureBrowsePushAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.4;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    toView.hidden = YES;
    [containerView addSubview:toView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 0;
    [containerView addSubview:bgView];
    
    CGRect fromFrame = [self.transitionParameter.firstVCImgFrames[self.transitionParameter.transitionImgIndex] CGRectValue];
    CGRect toFrame = self.transitionParameter.secondVCImgFrame;
    
    //过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.transitionParameter.transitionImage];
    transitionImgView.layer.masksToBounds = YES;
    transitionImgView.contentMode = UIViewContentModeScaleAspectFill;
    transitionImgView.frame = fromFrame;
    [containerView addSubview:transitionImgView];
    
    //这就是动画啦啦啦
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        transitionImgView.frame = toFrame;
        bgView.alpha = 1;
        
    } completion:^(BOOL finished) {
        
        toView.hidden = NO;
        
        [bgView removeFromSuperview];
        [transitionImgView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}

@end

