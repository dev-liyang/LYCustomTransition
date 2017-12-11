//
//  LYPictureFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYPictureBrowserCell.h"
#import <SDWebImage/SDWebImage-umbrella.h>
#import <SDWebImage/SDImageCache.h>

@interface LYPictureBrowserCell ()

@property (nonatomic, strong) LYPictureBrowseSouceModel *model;

@end

@implementation LYPictureBrowserCell

#pragma mark - Life cycle

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        [self setupView];
    }
    return self;
}
- (void)setupView {
    [self.contentView addSubview:self.pictureImageScrollView];
}

#pragma mark - Setter and getter
- (LYBrowseZoomScrollView *)pictureImageScrollView {
    if (!_pictureImageScrollView) {
        _pictureImageScrollView = [[LYBrowseZoomScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];
        _pictureImageScrollView.backgroundColor = [UIColor blackColor];
        _pictureImageScrollView.zoomScale = 1.0f;
        
        __weak typeof(self)weakSelf = self;
        [_pictureImageScrollView setTapBlock:^{
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(imageViewClick:)]) {
                [weakSelf.delegate imageViewClick:weakSelf.cellIndex];
            }
        }];
    }
    return _pictureImageScrollView;
}

#pragma mark - Public methods

- (void)showWithModel:(LYPictureBrowseSouceModel *)model {
    self.model = model;
    
    UIImageView *imageView = _pictureImageScrollView.zoomImageView;
    
    UIImage * placeholderImage = [UIImage imageNamed:@"nodata"];
    imageView.image = placeholderImage;
    [self setPictureImage:placeholderImage];
    
    if (model.image){
        imageView.image = model.image;
        [self setPictureImage:model.image];
        
    }else if (model.imgUrl_thumb.length){
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:imageView.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if(!error){
                [self setPictureImage:image];
            }
        }];
    }
    
    if(model.imgUrl.length){
        [imageView sd_setImageWithURL:[NSURL URLWithString:model.imgUrl] placeholderImage:imageView.image completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if(!error){
                [self setPictureImage:image];
            }
        }];
    }
    
}

- (void)setPictureImage:(UIImage *)image{
    
    CGSize size = [self backImageSize:image];
    
    // 将scrollview的contentSize设置成缩放前
    _pictureImageScrollView.contentSize = CGSizeMake(size.width, size.height);
    _pictureImageScrollView.contentOffset = CGPointMake(0, 0);
    
    CGFloat imageY = (_pictureImageScrollView.frame.size.height - size.height) * 0.5;
    imageY = imageY > 0 ? imageY: 0;
    _pictureImageScrollView.zoomImageView.frame = CGRectMake(0, imageY, _pictureImageScrollView.frame.size.width, size.height);
}

- (CGSize)backImageSize:(UIImage *)image{
    
    CGSize size = image.size;
    CGSize newSize;
    newSize.width = SCREENWIDTH;
    newSize.height = newSize.width / size.width * size.height;
    
    return newSize;
}

// 获取指定视图在window中的位置
- (CGRect)getFrameInWindow:(UIView *)view
{
    return [view convertRect:view.bounds toView:[UIApplication sharedApplication].keyWindow];
}

@end
