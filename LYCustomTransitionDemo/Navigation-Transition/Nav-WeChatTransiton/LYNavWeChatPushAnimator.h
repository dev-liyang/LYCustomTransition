//
//  LYNavWeChatPushAnimator.h
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNavWeChatPushAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) UIImageView *transitionImgView;   //转场图片

@property (nonatomic, assign) CGRect transitionBeforeImgFrame;  //转场前图片的frame

@property (nonatomic, assign) CGRect transitionAfterImgFrame;   //转场后图片的frame

@end
