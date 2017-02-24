//
//  LYNavImitateKuGouAnimationTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavImitateKuGouAnimationTransition.h"

#import "LYNavImitateKuGouPushAnimator.h"
#import "LYNavImitateKuGouPopAnimator.h"

@interface LYNavImitateKuGouAnimationTransition ()

@property (nonatomic, strong) LYNavImitateKuGouPushAnimator *customPush;
@property (nonatomic, strong) LYNavImitateKuGouPopAnimator  *customPop;

@end

@implementation LYNavImitateKuGouAnimationTransition


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


@end

