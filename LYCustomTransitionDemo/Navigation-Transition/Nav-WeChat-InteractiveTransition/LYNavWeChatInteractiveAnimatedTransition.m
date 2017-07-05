//
//  LYNavWeChatInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavWeChatInteractiveAnimatedTransition.h"
#import "LYNavWeChatInteractivePushAnimator.h"
#import "LYNavWeChatInteractivePopAnimator.h"
#import "LYNavWeChatPercentDrivenInteractive.h"

@interface LYNavWeChatInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYNavWeChatInteractivePushAnimator *customPush;
@property (nonatomic, strong) LYNavWeChatInteractivePopAnimator  *customPop;
@property (nonatomic, strong) LYNavWeChatPercentDrivenInteractive *percentIntractive;

@end

@implementation LYNavWeChatInteractiveAnimatedTransition

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView{
    self.customPop.transitionImgView = transitionImgView;
    self.customPush.transitionImgView = transitionImgView;
}

/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame{
    self.customPop.transitionBeforeImgFrame = frame;
    self.customPush.transitionBeforeImgFrame = frame;
    self.percentIntractive.beforeImageViewFrame = frame;
}

/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame{
    self.customPop.transitionAfterImgFrame = frame;
    self.customPush.transitionAfterImgFrame = frame;
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

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(nonnull id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.gestureRecognizer)
        return self.percentIntractive;
    else
        return nil;
    
}

-(LYNavWeChatInteractivePushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYNavWeChatInteractivePushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavWeChatInteractivePopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYNavWeChatInteractivePopAnimator alloc] init];
    }
    return _customPop;
}
- (LYNavWeChatPercentDrivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYNavWeChatPercentDrivenInteractive alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _percentIntractive;
    
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

@end

