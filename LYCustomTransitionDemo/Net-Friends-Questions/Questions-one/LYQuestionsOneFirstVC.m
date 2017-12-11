//
//  LYQuestionsOneFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/15.
//  Copyright © 2017年 liyang. All rights reserved.
//

//网友问题解答
//问题链接:http://www.cocoachina.com/bbs/read.php?tid-1714556.html
#import "LYQuestionsOneFirstVC.h"
#import "LYQuestionsOneAnimationTrasition.h"
#import "LYQuestionOneCell.h"
#import "LYQuestionsOneSecondVC.h"

@interface LYQuestionsOneFirstVC () <UINavigationControllerDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView      *tableView;
@property (nonatomic, strong) NSMutableArray   *imageDataArray;

@property (nonatomic, strong) LYQuestionsOneAnimationTrasition *animatedTransition;

@end

@implementation LYQuestionsOneFirstVC

- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.animatedTransition = nil;
    self.navigationController.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _imageDataArray = [NSMutableArray array];
    //构造图片数据
    for (int i = 1; i <= 5; i ++) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"BeautyCar%.2d",i] ofType:@"jpg"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        [_imageDataArray addObject:img];
    }
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _imageDataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LYQuestionOneCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([LYQuestionOneCell class])];
    if (!cell) {
        cell = [[LYQuestionOneCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:NSStringFromClass([LYQuestionOneCell class])];
    }
    cell.cellIndex = indexPath.row;
    [cell setImageForImgView:_imageDataArray[indexPath.row]];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 220;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    //1. 设置代理
    self.animatedTransition = nil;
    self.navigationController.delegate = self.animatedTransition;
    
    //2. 传入必要的3个参数
    
    LYQuestionOneCell * cell = (LYQuestionOneCell *)[_tableView cellForRowAtIndexPath:indexPath];
    CGRect imgFrame = [self getFrameInWindow:cell.imgView];
    
    [self.animatedTransition setTransitionImgView:cell.imgView];
    [self.animatedTransition setTransitionBeforeImgFrame:imgFrame];
    [self.animatedTransition setTransitionAfterImgFrame:[self backScreenImageViewRectWithImage:cell.imgView.image]];
    
    //3.push跳转
    LYQuestionsOneSecondVC *second = [[LYQuestionsOneSecondVC alloc] init];
    second.image = cell.imgView.image;
    second.imgFrame = [self backScreenImageViewRectWithImage:cell.imgView.image];
    [self.navigationController pushViewController:second animated:YES];
}

#pragma mark - Setter - Getter
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor colorWithRed:0.1 green:0.7 blue:0.4 alpha:1];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (LYQuestionsOneAnimationTrasition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYQuestionsOneAnimationTrasition alloc] init];
    }
    return _animatedTransition;
}

#pragma mark - Custom
#pragma mark - Delegate

// 获取指定视图在window中的位置
- (CGRect)getFrameInWindow:(UIView *)view
{
    return [view.superview convertRect:view.frame toView:nil];
}

- (CGRect)backScreenImageViewRectWithImage:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.height = kScreenWidth * 0.6;
    newSize.width = newSize.height / size.height * size.width;
    
    CGFloat imageY = 0;
    CGFloat imageX = (kScreenWidth - newSize.width) * 0.5;

    CGRect rect =  CGRectMake(imageX, imageY, newSize.width, newSize.height);
    
    return rect;
}

@end

