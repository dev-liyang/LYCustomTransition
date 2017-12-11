//
//  LYPictureBrowsePopAnimator.h
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

@class LYPictureBrowseTransitionParameter;

@interface LYPictureBrowsePopAnimator : NSObject<UIViewControllerAnimatedTransitioning>

@property (nonatomic, strong) LYPictureBrowseTransitionParameter *transitionParameter;

@end
