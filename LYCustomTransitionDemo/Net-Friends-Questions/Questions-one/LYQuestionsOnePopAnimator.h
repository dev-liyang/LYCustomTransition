//
//  LYQuestionsOnePopAnimator.h
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/16.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionsOnePopAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImageView *transitionImgView;

@property (nonatomic, assign) CGRect transitionBeforeImgFrame;  //转场前图片的frame

@property (nonatomic, assign) CGRect transitionAfterImgFrame;   //转场后图片的frame

@end
