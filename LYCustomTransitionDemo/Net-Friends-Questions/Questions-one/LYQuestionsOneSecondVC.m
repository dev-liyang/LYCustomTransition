//
//  LYQuestionsOneSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/15.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionsOneSecondVC.h"

@interface LYQuestionsOneSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation LYQuestionsOneSecondVC

- (void)viewWillDisappear:(BOOL)animated{
    _imgView.hidden = YES;
    self.navigationController.navigationBarHidden = NO;
    
    [super viewWillDisappear:animated];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"WeChatSecond";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imgView = [[UIImageView alloc] initWithFrame:self.imgFrame];
    _imgView.image = self.image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
    
    //返回按钮
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 20, 60, 44)];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(backBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //其他
    CGFloat labelY = CGRectGetMaxY(self.imgView.frame) + 10;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, labelY, kScreenWidth - 20, kScreenHeight - labelY - 10)];
    label.numberOfLines = 0;
    label.text = @"测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据测试数据";
    [self.view addSubview:label];
}

- (void)backBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

