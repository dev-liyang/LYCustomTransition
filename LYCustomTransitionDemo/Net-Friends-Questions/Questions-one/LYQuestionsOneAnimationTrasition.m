//
//  LYQuestionsOneAnimationTrasition.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/16.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionsOneAnimationTrasition.h"
#import "LYQuestionsOnePopAnimator.h"
#import "LYQuestionsOnePushAnimator.h"

@interface LYQuestionsOneAnimationTrasition ()

@property (nonatomic, strong) LYQuestionsOnePushAnimator *customPush;
@property (nonatomic, strong) LYQuestionsOnePopAnimator  *customPop;

@end

@implementation LYQuestionsOneAnimationTrasition

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

- (LYQuestionsOnePushAnimator *)customPush{
    if (_customPush == nil) {
        _customPush = [[LYQuestionsOnePushAnimator alloc]init];
    }
    return _customPush;
}

- (LYQuestionsOnePopAnimator *)customPop{
    if (!_customPop) {
        _customPop = [[LYQuestionsOnePopAnimator alloc] init];
    }
    return _customPop;
}

@end

