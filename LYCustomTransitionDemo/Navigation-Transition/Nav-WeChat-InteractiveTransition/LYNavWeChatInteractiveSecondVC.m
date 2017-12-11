//
//  LYWeChatInteractiveSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavWeChatInteractiveSecondVC.h"
#import "LYNavWeChatInteractiveAnimatedTransition.h"
#import "AppDelegate.h"

@interface LYNavWeChatInteractiveSecondVC ()

@property (nonatomic, strong) LYNavWeChatInteractiveAnimatedTransition *animatedTransition;
@property (nonatomic, assign) CGPoint transitionImgViewCenter;

@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYNavWeChatInteractiveSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WeChatSecond";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImage *image = [UIImage imageNamed:@"Wechat-Interactive.jpeg"];
    CGSize size = [self backImageSize:image];
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - size.height) * 0.5, size.width, size.height)];
    _imgView.image = image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    self.transitionImgViewCenter = _imgView.center;
    
    
    UIPanGestureRecognizer *interactiveTransitionRecognizer;
    interactiveTransitionRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(interactiveTransitionRecognizerAction:)];
    [self.view addGestureRecognizer:interactiveTransitionRecognizer];
}

- (void)interactiveTransitionRecognizerAction:(UIPanGestureRecognizer *)gestureRecognizer
{
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];

    CGFloat scale = 1 - (translation.y / kScreenHeight);
    scale = scale < 0 ? 0 : scale;
    scale = scale > 1 ? 1 : scale;
    
    NSLog(@"second = %f", scale);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan:{
            
            //1. 设置代理
            self.animatedTransition = nil;
            
            self.navigationController.delegate = self.animatedTransition;
            
            self.animatedTransition.gestureRecognizer = gestureRecognizer;
            //3.push跳转
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            
            self.tabBarController.tabBar.alpha = scale;
            
            _imgView.center = CGPointMake(self.transitionImgViewCenter.x + translation.x * scale, self.transitionImgViewCenter.y + translation.y);
            _imgView.transform = CGAffineTransformMakeScale(scale, scale);
            
            self.animatedTransition.beforeImageViewFrame = self.beforeImageViewFrame;
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            
            if (scale > 0.95f) {
                [UIView animateWithDuration:0.2 animations:^{
                    
                    self.imgView.center = self.transitionImgViewCenter;
                    _imgView.transform = CGAffineTransformMakeScale(1, 1);
                } completion:^(BOOL finished) {
                    
                    _imgView.transform = CGAffineTransformIdentity;
                }];
            }else{
                
            }
            self.animatedTransition.currentImageView = _imgView;
            self.animatedTransition.currentImageViewFrame = _imgView.frame;
            
            self.animatedTransition = nil;
            self.navigationController.delegate = self.animatedTransition;
        }
    }
}

- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}

- (LYNavWeChatInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYNavWeChatInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

