//
//  LYModalWeChatPercentDrivenInteractive.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalWeChatPercentDrivenInteractive.h"

@interface LYModalWeChatPercentDrivenInteractive ()

@property (nonatomic, weak) id<UIViewControllerContextTransitioning> transitionContext;
@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecognizer;

@property(nonatomic, strong) UIView *bgView;
@property(nonatomic, strong) UIView *fromView;

@property(nonatomic, strong) UIView *beforeImgWhiteView;
@property(nonatomic, strong) UIView *blackBgView;

@end

@implementation LYModalWeChatPercentDrivenInteractive
{
    BOOL _isFirst;
}

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer
{
    self = [super init];
    if (self)
    {
        _isFirst = YES;
        _gestureRecognizer = gestureRecognizer;
        
        [_gestureRecognizer addTarget:self action:@selector(gestureRecognizeDidUpdate:)];
    }
    return self;
}

- (void)dealloc
{
    [self.gestureRecognizer removeTarget:self action:@selector(gestureRecognizeDidUpdate:)];
}


- (CGFloat)percentForGesture:(UIPanGestureRecognizer *)gesture
{
    
    CGPoint translation = [gesture translationInView:gesture.view];
    
    CGFloat scale = 1 - fabs(translation.y / kScreenHeight);
    scale = scale < 0 ? 0 : scale;
    return scale;
}

- (void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGFloat scrale = [self percentForGesture:gestureRecognizer];
    NSLog(@"interactive %f",scrale);
    
    if (_isFirst) {
        [self beginInterPercent];
        _isFirst = NO;
    }
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            //没用
            
            break;
        case UIGestureRecognizerStateChanged:
            
            [self updateInteractiveTransition:[self percentForGesture:gestureRecognizer]];
            [self updateInterPercent:[self percentForGesture:gestureRecognizer]];
            
            break;
        case UIGestureRecognizerStateEnded:
            
            if (scrale > 0.95f){
                
                [self cancelInteractiveTransition];
                [self interPercentCancel];
            }
            else{
                [self finishInteractiveTransition];
                [self interPercentFinish:scrale];
            }
            break;
        default:
            [self cancelInteractiveTransition];
            [self interPercentCancel];
            break;
    }
}

- (void)beginInterPercent{
    //    NSLog(@"开始");
    
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //图片背景白色的空白view
    
    _beforeImgWhiteView = [[UIView alloc] initWithFrame:self.beforeImageViewFrame];
    _beforeImgWhiteView.backgroundColor = [UIColor whiteColor];
    [containerView addSubview:_beforeImgWhiteView];
    
    //有渐变的黑色背景
    _blackBgView = [[UIView alloc] initWithFrame:containerView.bounds];
    _blackBgView.backgroundColor = [UIColor blackColor];
    [containerView addSubview:_blackBgView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    fromView.backgroundColor = [UIColor clearColor];
    [containerView addSubview:fromView];
    
}
- (void)updateInterPercent:(CGFloat)scale{
    //    NSLog(@"变化");
    
    _blackBgView.alpha = scale * scale * scale;
}

- (void)interPercentCancel{
    //    NSLog(@"取消");
    
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //FromVC
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIView *fromView = fromViewController.view;
    fromView.backgroundColor = [UIColor blackColor];
    [containerView addSubview:fromView];
    
    [_blackBgView removeFromSuperview];
    [_beforeImgWhiteView removeFromSuperview];
    _blackBgView = nil;
    _beforeImgWhiteView = nil;
    
    [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
}
//完成
- (void)interPercentFinish:(CGFloat)scale{
    //    NSLog(@"完成");
    id<UIViewControllerContextTransitioning> transitionContext = self.transitionContext;
    
    //转场过渡的容器view
    UIView *containerView = [transitionContext containerView];
    
    //ToVC
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView *toView = toViewController.view;
    [containerView addSubview:toView];
    
    //图片背景白色的空白view
    UIView *imgBgWhiteView = [[UIView alloc] initWithFrame:self.beforeImageViewFrame];
    imgBgWhiteView.backgroundColor =[UIColor whiteColor];
    [containerView addSubview:imgBgWhiteView];
    
    //有渐变的黑色背景
    UIView *bgView = [[UIView alloc] initWithFrame:containerView.bounds];
    bgView.backgroundColor = [UIColor blackColor];
    bgView.alpha = scale;
    [containerView addSubview:bgView];
    
    //过渡的图片
    UIImageView *transitionImgView = [[UIImageView alloc] initWithImage:self.currentImageView.image];
    transitionImgView.clipsToBounds = YES;
    transitionImgView.frame = self.currentImageViewFrame;
    [containerView addSubview:transitionImgView];
    
    [UIView animateWithDuration:0.4 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.1 options:UIViewAnimationOptionCurveLinear animations:^{
        
        transitionImgView.frame = self.beforeImageViewFrame;
        bgView.alpha = 0;
        
    }completion:^(BOOL finished) {
        
        NSLog(@"panGesture animation finished");
        
        [_blackBgView removeFromSuperview];
        [_beforeImgWhiteView removeFromSuperview];
        _blackBgView = nil;
        _beforeImgWhiteView = nil;
        
        [bgView removeFromSuperview];
        [imgBgWhiteView removeFromSuperview];
        [transitionImgView removeFromSuperview];
        
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
    }];
    
}
- (void)startInteractiveTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    self.transitionContext = transitionContext;
    
    //    [super startInteractiveTransition:transitionContext];
}

@end
