//
//  LYModalKuGouPercentDerivenInteractive.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalKuGouPercentDerivenInteractive.h"

@interface LYModalKuGouPercentDerivenInteractive ()

@property (nonatomic, strong, readonly) UIPanGestureRecognizer *gestureRecognizer;

@end

@implementation LYModalKuGouPercentDerivenInteractive

- (void)startInteractiveTransition:(id <UIViewControllerContextTransitioning>)transitionContext{
    
    //此句话的重要性
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
    NSLog(@"interactive %f",scale);
    
    switch (gestureRecognizer.state)
    {
        case UIGestureRecognizerStateBegan:
            //没用
            
            break;
        case UIGestureRecognizerStateChanged:
            
            [self updateInteractiveTransition:scale];
            
            break;
        case UIGestureRecognizerStateEnded:
            
            if (scale < 0.2f){
                
                [self cancelInteractiveTransition];
            }
            else{
                [self finishInteractiveTransition];
            }
            break;
        default:
            [self cancelInteractiveTransition];
            break;
    }
}



@end

