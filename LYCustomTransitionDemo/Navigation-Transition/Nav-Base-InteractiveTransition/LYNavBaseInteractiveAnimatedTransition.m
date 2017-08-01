//
//  LYNavBaseInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseInteractiveAnimatedTransition.h"
#import "LYNavBaseCustomAnimator.h"
#import "LYNavBasePercentDerivenInteractive.h"

@interface LYNavBaseInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYNavBaseCustomAnimator *customAnimator;
@property (nonatomic, strong) LYNavBasePercentDerivenInteractive *percentIntractive;

@end

@implementation LYNavBaseInteractiveAnimatedTransition


#pragma mark - UINavigationControllerDelegate

- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                            animationControllerForOperation:(UINavigationControllerOperation)operation
                                                         fromViewController:(UIViewController *)fromVC
                                                           toViewController:(UIViewController *)toVC{
    if (operation == UINavigationControllerOperationPush) {
        return self.customAnimator;
        
    }else if (operation == UINavigationControllerOperationPop){
        return self.customAnimator;
    }
    return nil;
}

- (LYNavBaseCustomAnimator *)customAnimator
{
    if (_customAnimator == nil) {
        _customAnimator = [[LYNavBaseCustomAnimator alloc]init];
    }
    return _customAnimator;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController
                                   interactionControllerForAnimationController:(id <UIViewControllerAnimatedTransitioning>) animationController{
    
    if (self.gestureRecognizer)//判断有手势，才去调用初始化
        return self.percentIntractive;
    else
        return nil;
}

- (void)setGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer{
    _gestureRecognizer = gestureRecognizer;
}
- (LYNavBasePercentDerivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYNavBasePercentDerivenInteractive alloc] initWithGestureRecognizer:self.gestureRecognizer];
    }
    return _percentIntractive;
}


@end
