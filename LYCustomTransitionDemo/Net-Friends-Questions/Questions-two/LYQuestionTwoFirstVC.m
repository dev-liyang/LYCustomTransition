//
//  LYQuestionTwoFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/15.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionTwoFirstVC.h"
#import "LYQuestionTwoAnimationTransition.h"
#import "LYQuestionTwoSecondVC.h"

@interface LYQuestionTwoFirstVC ()

@property (nonatomic, strong) LYQuestionTwoAnimationTransition *animatedTransition;

@property (nonatomic, strong) UIImageView         *flipView;
@property (nonatomic, strong) UIImageView         *imgView;

@end

@implementation LYQuestionTwoFirstVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.animatedTransition = nil;
    self.navigationController.delegate = nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"QuestionTwo";
    self.view.backgroundColor = bgColor;
    
    UIImage *img = [UIImage imageNamed:@"flip"];
    CGSize size;
    size.height = 120;
    size.width = size.height / img.size.height * img.size.width;
    
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 100, size.width, size.height)];
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
    
    
    UIImage *contentImg = [UIImage imageNamed:@"content"];
    //2. 传入必要的3个参数
    [self.animatedTransition setTransitionImg:contentImg];
    [self.animatedTransition setTransitionBeforeImgFrame:_imgView.frame];
    
    [self.animatedTransition setFlipImg:_imgView.image];
    
    //3.push跳转
    LYQuestionTwoSecondVC *second = [[LYQuestionTwoSecondVC alloc] init];
    [self.navigationController pushViewController:second animated:YES];
}

- (LYQuestionTwoAnimationTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYQuestionTwoAnimationTransition alloc] init];
    }
    return _animatedTransition;
}

@end

