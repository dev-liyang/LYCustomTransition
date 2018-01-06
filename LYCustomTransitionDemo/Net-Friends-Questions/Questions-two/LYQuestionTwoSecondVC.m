//
//  LYQuestionTwoSecondVC.m
//  LYCustomTransitionDemo
//
//  Created by kurt lee on 2017/12/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionTwoSecondVC.h"

@interface LYQuestionTwoSecondVC ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation LYQuestionTwoSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"QuestionTwoSecond";
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImage *image = [UIImage imageNamed:@"content"];
    _imgView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imgView.image = image;
    _imgView.userInteractionEnabled = YES;
    [self.view addSubview:_imgView];
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

