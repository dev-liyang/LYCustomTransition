//
//  LYPictureBrowseInteractiveAnimatedTransition.h
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYPictureBrowseTransitionParameter.h"

@interface LYPictureBrowseInteractiveAnimatedTransition : NSObject<UIViewControllerTransitioningDelegate>

@property (nonatomic, strong) LYPictureBrowseTransitionParameter *transitionParameter;

@end
