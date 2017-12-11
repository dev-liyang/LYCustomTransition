//
//  LYPictureBrowseViewController.h
//  FollowMe
//
//  Created by liyang on 16/10/12.
//  Copyright © 2016年 FM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYPictureBrowseInteractiveAnimatedTransition.h"

#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

//图片浏览器中图片之间的水平间距
#define kBrowseSpace 50.0f

@class LYPictureBrowseSouceModel;

@interface LYPictureBrowseViewController : UIViewController

@property (nonatomic, strong) LYPictureBrowseInteractiveAnimatedTransition *animatedTransition;

@property (nonatomic, strong) NSArray<LYPictureBrowseSouceModel *> *dataSouceArray;


@end
