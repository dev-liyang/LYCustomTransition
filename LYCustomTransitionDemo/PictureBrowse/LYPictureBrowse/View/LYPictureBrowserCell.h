//
//  LYPictureBrowserCell.h
//  FollowMe
//
//  Created by liyang on 16/10/12.
//  Copyright © 2016年 FM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LYBrowseZoomScrollView.h"
#import "LYPictureBrowseSouceModel.h"
#define SCREENWIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREENHEIGHT ([UIScreen mainScreen].bounds.size.height)

@protocol LYPictureBrowserCellDelegate <NSObject>

- (void)imageViewClick:(NSInteger)cellIndex;

@end

@interface LYPictureBrowserCell : UICollectionViewCell

@property (nonatomic, weak)   id <LYPictureBrowserCellDelegate> delegate;
@property (nonatomic, assign) NSInteger cellIndex;
@property (nonatomic, strong) LYBrowseZoomScrollView *pictureImageScrollView;

- (void)showWithModel:(LYPictureBrowseSouceModel *)model;

@end
