//
//  LYCATransitionSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYCATransitionSecondVC.h"

@interface LYCATransitionSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation LYCATransitionSecondVC
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Second";
    self.view.backgroundColor = [UIColor blackColor];
    self.view.layer.masksToBounds = YES;
    UIImage *image = [UIImage imageNamed:@"CATransition"];
    CGSize size = [self backImageSize:image];
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, (kScreenHeight - size.height) * 0.5, size.width, size.height)];
    _imgView.image = image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"CATransition" style:UIBarButtonItemStylePlain target:self action:@selector(customPopViewController)];

}

- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = kScreenWidth;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}

- (void)customPopViewController{
    [self.navigationController.view.layer addAnimation:[self popAnimation] forKey:nil];
    [self.navigationController popViewControllerAnimated:NO];
}
- (CATransition *)popAnimation{
    
    CATransition* transition = [CATransition animation];
    transition.duration = 0.8;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    /*
     cube                   立方体效果
     pageCurl               向上翻一页
     pageUnCurl             向下翻一页
     rippleEffect           水滴波动效果
     suckEffect             变成小布块飞走的感觉
     oglFlip                上下翻转
     cameraIrisHollowClose  相机镜头关闭效果
     cameraIrisHollowOpen   相机镜头打开效果
     */
    
    transition.type = @"pageUnCurl";
//    transition.type = kCATransitionMoveIn;
    
    //下面四个是系统列举出来的常见的类型
    //kCATransitionMoveIn, kCATransitionPush, kCATransitionReveal, kCATransitionFade
    
    transition.subtype = kCATransitionFromRight;
    //kCATransitionFromLeft, kCATransitionFromRight, kCATransitionFromTop, kCATransitionFromBottom
    
    return transition;
}

@end
