//
//  LYNavWeChatVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYNavWeChatVC.h"
#import "LYNavWeChatSecondVC.h"
#import "LYNavWeChatAnimationTransition.h"
@interface LYNavWeChatVC ()

@property (nonatomic, strong) LYNavWeChatAnimationTransition *animatedTransition;

@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYNavWeChatVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.animatedTransition = nil;
    self.navigationController.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"WeChat";
    self.view.backgroundColor = bgColor;
    
    UIImage *img = [UIImage imageNamed:@"wechat.jpg"];
    CGSize size;
    size.height = 120;
    size.width = size.height / img.size.height * img.size.width;
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(70, 70, size.width, size.height)];
    _imgView.image = img;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pushSecond)];
    [_imgView addGestureRecognizer:tap];
}

- (void)pushSecond{
    //1. 设置代理
    self.animatedTransition = nil;
    self.navigationController.delegate = self.animatedTransition;
    
    //2. 传入必要的3个参数
    [self.animatedTransition setTransitionImgView:_imgView];
    [self.animatedTransition setTransitionBeforeImgFrame:_imgView.frame];
    [self.animatedTransition setTransitionAfterImgFrame:[self backScreenImageViewRectWithImage:_imgView.image]];
    
    //3.push跳转
    LYNavWeChatSecondVC *second = [[LYNavWeChatSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (LYNavWeChatAnimationTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYNavWeChatAnimationTransition alloc] init];
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
