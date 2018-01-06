//
//  LYQuestionTwoAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by kurt lee on 2017/12/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionTwoAnimationTransition.h"
#import "LYQuestionTwoPushAnimator.h"
#import "LYQuestionTwoPopAnimator.h"

@interface LYQuestionTwoAnimationTransition ()

@property (nonatomic, strong) LYQuestionTwoPushAnimator *customPush;
@property (nonatomic, strong) LYQuestionTwoPopAnimator  *customPop;

@end

@implementation LYQuestionTwoAnimationTransition

/** 转场过渡的图片 */
- (void)setTransitionImg:(UIImage *)transitionImg{
    self.customPush.transitionImg = transitionImg;
    self.customPop.transitionImg = transitionImg;
}
- (void)setFlipImg:(UIImage *)flipImg{
    self.customPush.flipImg = flipImg;
    self.customPop.flipImg = flipImg;
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

- (LYQuestionTwoPushAnimator *)customPush{
    if (_customPush == nil) {
        _customPush = [[LYQuestionTwoPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYQuestionTwoPopAnimator *)customPop{
    if (!_customPop) {
        _customPop = [[LYQuestionTwoPopAnimator alloc] init];
    }
    return _customPop;
}

@end

