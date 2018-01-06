//
//  LYQuestionTwoPopAnimator.m
//  LYCustomTransitionDemo
//
//  Created by kurt lee on 2017/12/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionTwoPopAnimator.h"

@implementation LYQuestionTwoPopAnimator

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext{
    return 0.7;
}
- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext{
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //图片背景的空白view (设置和控制器的背景颜色一样，给人一种图片被调走的假象)
    UIView *imgBgWhiteView = [[UIView alloc] initWithFrame:self.transitionBeforeImgFrame];
    imgBgWhiteView.backgroundColor = bgColor;
    [containerView addSubview:imgBgWhiteView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = 1;
    [containerView addSubview:bgView];
    
    //过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.transitionImg];
    transitionImgView.frame = transitionContext.containerView.bounds;
    [transitionContext.containerView addSubview:transitionImgView];
    
    UIImageView *flipView = [[UIImageView alloc] initWithImage:self.flipImg];
    [transitionContext.containerView addSubview:flipView];
    flipView.layer.anchorPoint = CGPointMake(0, 0.5);
    flipView.layer.transform = [self getTransForm3DWithAngle:-M_PI_2 - M_PI_4/2.0];
    flipView.frame = CGRectMake(0, 0, transitionContext.containerView.frame.size.width*0.7, transitionContext.containerView.frame.size.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        transitionImgView.frame = self.transitionBeforeImgFrame;
        
        flipView.layer.transform = [self getTransForm3DWithAngle:0];
        flipView.frame = self.transitionBeforeImgFrame;
        
        bgView.alpha = 0;
        
    } completion:^(BOOL finished) {
        
        BOOL wasCancelled = [transitionContext transitionWasCancelled];
        
        [imgBgWhiteView removeFromSuperview];
        [bgView removeFromSuperview];
        [transitionImgView removeFromSuperview];
//        [flipView removeFromSuperview];
        
        //设置transitionContext通知系统动画执行完毕
        [transitionContext completeTransition:!wasCancelled];
    }];
}
- (CATransform3D)getTransForm3DWithAngle:(CGFloat)angle{
    
    CATransform3D transform =CATransform3DIdentity;//获取一个标准默认的CATransform3D仿射变换矩阵
    
    transform.m34=4.5/-2000;//透视效果
    
    transform=CATransform3DRotate(transform,angle,0,1,0);//获取旋转angle角度后的rotation矩阵。
    
    return transform;
    
}

@end





