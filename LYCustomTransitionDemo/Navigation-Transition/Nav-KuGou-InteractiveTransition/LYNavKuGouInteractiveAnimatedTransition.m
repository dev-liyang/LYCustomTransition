//
//  LYNavKuGouInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavKuGouInteractiveAnimatedTransition.h"
#import "LYNavImitateKuGouPushAnimator.h"
#import "LYNavImitateKuGouPopAnimator.h"
#import "LYNavKuGouPercentDerivenInteractive.h"

@interface LYNavKuGouInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYNavImitateKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavImitateKuGouPopAnimator  *customPop;
@property (nonatomic, strong) LYNavKuGouPercentDerivenInteractive  *percentIntractive;

@end
@implementation LYNavKuGouInteractiveAnimatedTransition


- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    
    //此处的动画执行者和kugou非交互式中的执行者都是一样的,故此处不再重写，直接调用之前创建好的类
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
- (void)setGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    _gestureRecognizer = gestureRecognizer;
}
-(LYNavImitateKuGouPushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYNavImitateKuGouPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavImitateKuGouPopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYNavImitateKuGouPopAnimator alloc] init];
    }
    return _customPop;
}
- (LYNavKuGouPercentDerivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYNavKuGouPercentDerivenInteractive alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _percentIntractive;
    
}

@end

