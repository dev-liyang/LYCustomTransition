//
//  LYPictureBrowseTransitionParameter.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYPictureBrowseTransitionParameter.h"

@implementation LYPictureBrowseTransitionParameter

- (void)setTransitionImage:(UIImage *)transitionImage{
    _transitionImage = transitionImage;
    
    _secondVCImgFrame = [self backScreenImageViewRectWithImage:transitionImage];
}
- (void)setTransitionImgIndex:(NSInteger)transitionImgIndex{
    _transitionImgIndex = transitionImgIndex;
    
    _firstVCImgFrame = [_firstVCImgFrames[transitionImgIndex] CGRectValue];
}

//返回imageView在window上全屏显示时的frame
- (CGRect)backScreenImageViewRectWithImage:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = SCREENWIDTH;
    newSize.height = newSize.width / size.width * size.height;
    
    CGFloat imageY = (SCREENHEIGHT - newSize.height) * 0.5;
    
    if (imageY < 0) {
        imageY = 0;
    }
    CGRect rect =  CGRectMake(0, imageY, newSize.width, newSize.height);
    
    return rect;
}

@end
