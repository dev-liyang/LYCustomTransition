//
//  LYNavBaseInteractiveAnimatedTransition.h
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface LYNavBaseInteractiveAnimatedTransition : NSObject<UINavigationControllerDelegate>

@property (nonatomic, strong) UIPanGestureRecognizer *gestureRecognizer;

@end
