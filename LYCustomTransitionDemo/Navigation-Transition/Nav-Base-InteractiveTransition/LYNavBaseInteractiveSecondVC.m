//
//  LYNavBaseInteractiveSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavBaseInteractiveSecondVC.h"
#import "LYNavBaseInteractiveAnimatedTransition.h"

@interface LYNavBaseInteractiveSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) LYNavBaseInteractiveAnimatedTransition *animatedTransition;
@property (nonatomic, assign) CGPoint transitionImgViewCenter;

@end

@implementation LYNavBaseInteractiveSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"BaseSecond";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImage *image = [UIImage imageNamed:@"Base"];
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
    
    CGFloat scale = 1 - fabs(translation.x / kScreenWidth);
    scale = scale < 0 ? 0 : scale;
    
    NSLog(@"second = %f", scale);
    switch (gestureRecognizer.state) {
        case UIGestureRecognizerStatePossible:
            break;
        case UIGestureRecognizerStateBegan:{
            
            //1. 设置代理
            self.animatedTransition = nil;
            self.navigationController.delegate = self.animatedTransition;
            
            //2. 传值
            self.animatedTransition.gestureRecognizer = gestureRecognizer;
            
            //3. pop跳转
            [self.navigationController popViewControllerAnimated:YES];
        }
            break;
        case UIGestureRecognizerStateChanged: {
            
            break;
        }
        case UIGestureRecognizerStateFailed:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded: {
            
            self.animatedTransition.gestureRecognizer = nil;
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

- (LYNavBaseInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYNavBaseInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

