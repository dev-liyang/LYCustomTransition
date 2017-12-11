//
//  LYPictureBrowseInteractiveAnimatedTransition.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYPictureBrowseInteractiveAnimatedTransition.h"
#import "LYPictureBrowsePercentDrivenInteractive.h"
#import "LYPictureBrowsePushAnimator.h"
#import "LYPictureBrowsePopAnimator.h"

@interface LYPictureBrowseInteractiveAnimatedTransition ()

@property (nonatomic, strong) LYPictureBrowsePushAnimator *customPush;
@property (nonatomic, strong) LYPictureBrowsePopAnimator  *customPop;
@property (nonatomic, strong) LYPictureBrowsePercentDrivenInteractive *percentIntractive;

@end

@implementation LYPictureBrowseInteractiveAnimatedTransition

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    return self.customPush;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.customPop;
}

- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForPresentation:(id <UIViewControllerAnimatedTransitioning>)animator{
    
    return nil;//push时不加手势交互
}
- (nullable id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator{
    if (self.transitionParameter.gestureRecognizer)
        return self.percentIntractive;
    else
        return nil;
    
}

-(LYPictureBrowsePushAnimator *)customPush
{
    if (_customPush == nil) {
        _customPush = [[LYPictureBrowsePushAnimator alloc]init];
    }
    return _customPush;
}

- (LYPictureBrowsePopAnimator *)customPop {
    if (!_customPop) {
        _customPop = [[LYPictureBrowsePopAnimator alloc] init];
    }
    return _customPop;
}
- (LYPictureBrowsePercentDrivenInteractive *)percentIntractive{
    if (!_percentIntractive) {
        _percentIntractive = [[LYPictureBrowsePercentDrivenInteractive alloc] initWithTransitionParameter:self.transitionParameter];
    }
    return _percentIntractive;
}

-(void)setTransitionParameter:(LYPictureBrowseTransitionParameter *)transitionParameter{
    _transitionParameter = transitionParameter;
    
    self.customPush.transitionParameter = transitionParameter;
    self.customPop.transitionParameter = transitionParameter;
}

@end


