//
//  LYQuestionTwoAnimationTransition.h
//  LYCustomTransitionDemo
//
//  Created by kurt lee on 2017/12/13.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionTwoAnimationTransition : NSObject<UINavigationControllerDelegate>

/** 转场过渡的图片 */
- (void)setTransitionImg:(UIImage *)transitionImg;
/** 转场过渡的图片 */
- (void)setFlipImg:(UIImage *)flipImg;

/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame;
/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame;

@end
