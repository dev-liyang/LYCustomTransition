//
//  LYModalWeChatInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalWeChatInteractiveAnimatedTransition.h"
#import "LYNavWeChatInteractivePushAnimator.h"
#import "LYNavWeChatInteractivePopAnimator.h"
#import "LYModalWeChatPercentDrivenInteractive.h"

@interface LYModalWeChatInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYNavWeChatInteractivePushAnimator *customPush;
@property (nonatomic, strong) LYNavWeChatInteractivePopAnimator  *customPop;
@property (nonatomic, strong) LYModalWeChatPercentDrivenInteractive  *percentIntractive;

@end
@implementation LYModalWeChatInteractiveAnimatedTransition

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView{
    self.customPush.transitionImgView = transitionImgView;
    self.customPop.transitionImgView = transitionImgView;
}

/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame{
    self.customPop.transitionBeforeImgFrame = frame;
    self.customPush.transitionBeforeImgFrame = frame;
    self.percentIntractive.beforeImageViewFrame = frame;
}

/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame{
    self.customPush.transitionAfterImgFrame = frame;
    self.customPop.transitionAfterImgFrame = frame;
}

-(void)setBeforeImageViewFrame:(CGRect)beforeImageViewFrame{
    _beforeImageViewFrame = beforeImageViewFrame;
    self.percentIntractive.beforeImageViewFrame = beforeImageViewFrame;
}
- (void)setCurrentImageViewFrame:(CGRect)currentImageViewFrame{
    _currentImageViewFrame = currentImageViewFrame;
    self.percentIntractive.currentImageViewFrame = currentImageViewFrame;
}
- (void)setCurrentImageView:(UIImageView *)currentImageView{
    _currentImageView = currentImageView;
    self.percentIntractive.currentImageView = currentImageView;
}

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

- (void)setGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    _gestureRecognizer = gestureRecognizer;
}
- (LYNavWeChatInteractivePushAnimator *)customPush{
    if (_customPush == nil) {
        _customPush = [[LYNavWeChatInteractivePushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavWeChatInteractivePopAnimator *)customPop{
    if (!_customPop) {
        _customPop = [[LYNavWeChatInteractivePopAnimator alloc] init];
    }
    return _customPop;
}
- (LYModalWeChatPercentDrivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYModalWeChatPercentDrivenInteractive alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _percentIntractive;
    
}

@end

