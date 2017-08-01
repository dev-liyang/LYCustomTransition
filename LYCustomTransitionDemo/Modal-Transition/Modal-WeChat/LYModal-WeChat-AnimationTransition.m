//
//  LYModal-WeChat-AnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModal-WeChat-AnimationTransition.h"
#import "LYNavWeChatPushAnimator.h"
#import "LYNavWeChatPopAnimator.h"

@interface LYModal_WeChat_AnimationTransition ()

@property (nonatomic, strong) LYNavWeChatPushAnimator *customPush;
@property (nonatomic, strong) LYNavWeChatPopAnimator  *customPop;

@end

@implementation LYModal_WeChat_AnimationTransition

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView{
    self.customPush.transitionImgView = transitionImgView;
    self.customPop.transitionImgView = transitionImgView;
}

/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame{
    self.customPop.transitionBeforeImgFrame = frame;
    self.customPush.transitionBeforeImgFrame = frame;
}

/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame{
    self.customPush.transitionAfterImgFrame = frame;
    self.customPop.transitionAfterImgFrame = frame;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPush;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    //动画执行者和 nav中一样,故此处不再重写，直接调用之前navigation中的创建好的类
    return self.customPop;
}

- (LYNavWeChatPushAnimator *)customPush{
    if (_customPush == nil) {
        _customPush = [[LYNavWeChatPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavWeChatPopAnimator *)customPop{
    if (!_customPop) {
        _customPop = [[LYNavWeChatPopAnimator alloc] init];
    }
    return _customPop;
}

@end
