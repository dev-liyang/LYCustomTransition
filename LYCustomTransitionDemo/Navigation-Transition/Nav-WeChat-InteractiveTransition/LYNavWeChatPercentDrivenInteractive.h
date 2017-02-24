//
//  LYNavWeChatPercentDrivenInteractive.h
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/2/23.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LYNavWeChatPercentDrivenInteractive : UIPercentDrivenInteractiveTransition

- (instancetype)initWithGestureRecognizer:(UIPanGestureRecognizer*)gestureRecognizer;

@property (nonatomic, assign) CGRect            beforeImageViewFrame;   //图片的frame
@property (nonatomic, assign) CGRect            currentImageViewFrame;   //当前图片的frame
@property (nonatomic, strong) UIImageView      *currentImageView;        //当前图片

@end
