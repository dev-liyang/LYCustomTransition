//
//  LYNavWeChatAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavWeChatAnimationTransition.h"
#import "LYNavWeChatPushAnimator.h"
#import "LYNavWeChatPopAnimator.h"
@interface LYNavWeChatAnimationTransition ()

@property (nonatomic, strong) LYNavWeChatPushAnimator *customPush;
@property (nonatomic, strong) LYNavWeChatPopAnimator  *customPop;

@end

@implementation LYNavWeChatAnimationTransition

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


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.customPush;
        
    }else if (operation == UINavigationControllerOperationPop){
        return self.customPop;
    }
    return nil;
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
