//
//  LYQuestionTwoPushAnimator.h
//  LYCustomTransitionDemo
//
//  Created by kurt lee on 2017/12/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionTwoPushAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImage *transitionImg;           //转场图片
@property (nonatomic, strong) UIImage *flipImg;                 //翻转的图片


@property (nonatomic, assign) CGRect transitionBeforeImgFrame;  //转场前图片的frame

@property (nonatomic, assign) CGRect transitionAfterImgFrame;   //转场后图片的frame

@end

