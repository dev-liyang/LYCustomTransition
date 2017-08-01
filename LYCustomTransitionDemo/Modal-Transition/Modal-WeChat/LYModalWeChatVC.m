//
//  LYModalWeChatVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYModalWeChatVC.h"
#import "LYModal-WeChatSecondVC.h"
#import "LYModal-WeChat-AnimationTransition.h"

@interface LYModalWeChatVC ()

@property (nonatomic, strong) LYModal_WeChat_AnimationTransition *animatedTransition;

@property (nonatomic, strong) UIImageView         *imgView;
@end

@implementation LYModalWeChatVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WeChat";
    self.view.backgroundColor = bgColor;
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 70, 120, 120)];
    _imgView.image = [UIImage imageNamed:@"wechat.jpg"];
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)pushSecond{
    
    
    self.animatedTransition = nil;
    
    //1. 传入必要的3个参数
    [self.animatedTransition setTransitionImgView:_imgView];
    [self.animatedTransition setTransitionBeforeImgFrame:_imgView.frame];
    [self.animatedTransition setTransitionAfterImgFrame:[self backScreenImageViewRectWithImage:_imgView.image]];
    
    LYModal_WeChatSecondVC *second = [[LYModal_WeChatSecondVC alloc] init];
    //2.设置代理
    second.transitioningDelegate = self.animatedTransition;
    //3.push跳转
    [self presentViewController:second animated:YES completion:nil];
}

- (LYModal_WeChat_AnimationTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYModal_WeChat_AnimationTransition alloc] init];
    }
    return _animatedTransition;
}

//返回imageView在window上全屏显示时的frame
- (CGRect)backScreenImageViewRectWithImage:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    CGFloat imageY = (kScreenHeight - newSize.height) * 0.5;
    
    if (imageY < 0) {
        imageY = 0;
    }
    CGRect rect =  CGRectMake(0, imageY, newSize.width, newSize.height);
    
    return rect;
}

@end

