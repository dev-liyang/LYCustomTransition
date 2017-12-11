//
//  LYModal-WeChat-AnimationTransition.h
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/22.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYModal_WeChat_AnimationTransition : NSObject<UIViewControllerTransitioningDelegate>

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView;
/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame;
/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame;

@end
