//
//  LYNavImitateKuGouAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavKuGouAnimationTransition.h"

#import "LYNavKuGouPushAnimator.h"
#import "LYNavKuGouPopAnimator.h"

@interface LYNavKuGouAnimationTransition ()

@property (nonatomic, strong) LYNavKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavKuGouPopAnimator  *customPop;

@end

@implementation LYNavKuGouAnimationTransition


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

-(LYNavKuGouPushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYNavKuGouPushAnimator alloc]init];
    }
    return _customPush;
}

- (LYNavKuGouPopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYNavKuGouPopAnimator alloc] init];
    }
    return _customPop;
}


@end

