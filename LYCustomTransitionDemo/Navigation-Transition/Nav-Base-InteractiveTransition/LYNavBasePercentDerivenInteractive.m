//
//  LYNavBasePercentDerivenInteractive.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBasePercentDerivenInteractive.h"

@interface LYNavBasePercentDerivenInteractive ()

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation LYNavBasePercentDerivenInteractive

//实现 UIViewControllerInteractiveTransitioning 协议的方法（必须实现）
//开始交互转场
- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //相当于走到 Animator 中的代理方法去了，那里实现了具体的动画
    [super startInteractiveTransition:transitionContext];
}

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer *)gestureRecognizer
{
    self = [super init];
    if (self)
    {
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
    
    CGFloat scale = 1 - fabs(translation.x / kScreenWidth);
    scale = scale < 0 ? 0 : scale;
    return scale;
}

- (void)gestureRecognizeDidUpdate:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGFloat scale = 1 - [self percentForGesture:gestureRecognizer];
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            //没用
            
            break;
        case UIGestureRecognizerStateChanged:
            
            //更新百分比
            [self updateInteractiveTransition:scale];
            
            break;
        case UIGestureRecognizerStateEnded:
            
            if (scale < 0.3){
                //取消转场
                [self cancelInteractiveTransition];
            }
            else{
                //完成转场
                [self finishInteractiveTransition];
            }
            break;
        default:
            //取消转场
            [self cancelInteractiveTransition];
            break;
    }
}

@end
