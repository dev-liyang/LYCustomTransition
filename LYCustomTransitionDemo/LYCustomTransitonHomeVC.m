//
//  LYCustomTransitonHomeVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYCustomTransitonHomeVC.h"

#import "LYNavCATransitionFirstVC.h"
#import "LYModalCATransitionFirstVC.h"

#import "LYNavBaseVC.h"
#import "LYNavKugouVC.h"
#import "LYNavWeChatVC.h"
#import "LYNavBaseInteractiveVC.h"
#import "LYNavKuGouInteractiveVC.h"
#import "LYNavWeChatInteractiveVC.h"

#import "LYModalBaseVC.h"
#import "LYModalKuGouVC.h"
#import "LYModalWeChatVC.h"
#import "LYModalKuGouInteractiveVC.h"
#import "LYModalWeChatInteractiveVC.h"

#import "LYQuestionsOneFirstVC.h"
#import "LYQuestionTwoFirstVC.h"

#import "LYPictureFirstVC.h"


@interface LYCustomTransitonHomeVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, weak)   UITableView *tableView;
@property (nonatomic, copy)   NSArray *showDataArr;
@property (nonatomic, copy)   NSArray *sectionTitleArr;
@property (nonatomic, copy)   NSArray *vcClassArr;

@end

@implementation LYCustomTransitonHomeVC

#pragma mark - Life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.title = @"Home";
    
    _sectionTitleArr = @[@"CATransition", @"导航 Navigation-Transition", @"模态 Modal-Transition", @"网友提问", @"图片浏览器"];
    
    _showDataArr = @[
                     @[@"Nav-CATransition",
                       @"Modal-CATransition"],
                     
                     @[@"基础转场-非交互式",
                       @"仿酷狗转场-非交互式",
                       @"仿微信、苹果系统图片浏览转场-非交互式",
                       @"基础转场-交互式",
                       @"仿酷狗转场-交互式",
                       @"仿微信、苹果系统图片浏览转场-交互式"],
                     
                     @[@"基础转场",
                       @"仿酷狗转场-非交互式",
                       @"仿微信、苹果系统图片浏览转场-非交互式",
                       @"仿酷狗转场-交互式",
                       @"仿微信、苹果系统图片浏览转场-交互式"],
                     
                     @[@"Question-one-仿淘宝有好货详情转场动画",
                       @"Question-two-仿掌阅转场动画"],
                     
                     @[@"PictureBrowse"]
                     ];
    
    _vcClassArr = @[
                    @[@"LYNavCATransitionFirstVC",
                      @"LYModalCATransitionFirstVC"],
                    
                    @[@"LYNavBaseVC",
                      @"LYNavKugouVC",
                      @"LYNavWeChatVC",
                      @"LYNavBaseInteractiveVC",
                      @"LYNavKuGouInteractiveVC",
                      @"LYNavWeChatInteractiveVC"],
                    
                    @[@"LYModalBaseVC",
                      @"LYModalKuGouVC",
                      @"LYModalWeChatVC",
                      @"LYModalKuGouInteractiveVC",
                      @"LYModalWeChatInteractiveVC"],
                    
                    @[@"LYQuestionsOneFirstVC",
                      @"LYQuestionTwoFirstVC"],
                    
                    @[@"LYPictureFirstVC"]
                    ];
    
    [self createUI];
    
}

#pragma mark - Create view

- (void)createUI
{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) style:UITableViewStyleGrouped];
    tableView.backgroundColor = bgColor;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:tableView];
    self.tableView = tableView;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.backgroundColor = bgColor;
    }
    cell.textLabel.text = self.showDataArr[indexPath.section][indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.showDataArr count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [(NSArray *)self.showDataArr[section] count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 34;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

- (nullable UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 34)];
    label.textColor = [UIColor redColor];
    label.text = self.sectionTitleArr[section];
    label.textAlignment = NSTextAlignmentCenter;
    [view addSubview:label];
    
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *vcClassName = _vcClassArr[indexPath.section][indexPath.row];
    Class vc = NSClassFromString(vcClassName);
    UIViewController *baseVC = [[vc alloc] init];
    [self.navigationController pushViewController:baseVC animated:YES];
}

@end




