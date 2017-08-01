//
//  LYWeChatInteractiveSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalWeChatInteractiveSecondVC.h"
#import "LYModalWeChatInteractiveAnimatedTransition.h"

@interface LYModalWeChatInteractiveSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) LYModalWeChatInteractiveAnimatedTransition *animatedTransition;
@property (nonatomic, assign) CGPoint transitionImgViewCenter;

@end

@implementation LYModalWeChatInteractiveSecondVC

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIView *navView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 44, 44)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
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
    
    CGFloat scale = 1 - fabs(translation.y / kScreenHeight);
    scale = scale < 0 ? 0 : scale;
    
    NSLog(@"second = %f", scale);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan:{
            
            //1. 设置代理
            self.animatedTransition = nil;
            
            self.transitioningDelegate = self.animatedTransition;
            
            self.animatedTransition.gestureRecognizer = gestureRecognizer;
            
            //3.dismiss
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
            break;
        case UIGestureRecognizerStateChanged: {
            
            _imgView.center = CGPointMake(self.transitionImgViewCenter.x + translation.x * scale, self.transitionImgViewCenter.y + translation.y);
            _imgView.transform = CGAffineTransformMakeScale(scale, scale);
            
            self.animatedTransition.beforeImageViewFrame = self.beforeImageViewFrame;
            
        }
            break;
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
            
            self.animatedTransition.gestureRecognizer = nil;
        }
    }
}

- (LYModalWeChatInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYModalWeChatInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}

- (void)backBtnClick:(UIButton *)button{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end


