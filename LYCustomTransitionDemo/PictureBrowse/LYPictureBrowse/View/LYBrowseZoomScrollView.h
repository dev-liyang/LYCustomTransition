//
//  LYBrowseZoomScrollView.h
//  LYTransitionDemo
//
//  Created by liyang on 16/10/12.
//  Copyright © 2016年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

@interface LYBrowseZoomScrollView : UIScrollView<UIScrollViewDelegate>

@property (nonatomic,strong) UIImageView *zoomImageView;
@property (nonatomic,copy)   void (^tapBlock)();

@end
