//
//  LYQuestionsOneAnimationTrasition.h
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/16.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYQuestionsOneAnimationTrasition : NSObject<UINavigationControllerDelegate>

/** 转场过渡的图片 */
- (void)setTransitionImgView:(UIImageView *)transitionImgView;
/** 转场前的图片frame */
- (void)setTransitionBeforeImgFrame:(CGRect)frame;
/** 转场后的图片frame */
- (void)setTransitionAfterImgFrame:(CGRect)frame;

@end
