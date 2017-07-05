//
//  LYQuestionOneCell.h
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/15.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol LYFourTableViewCellDelegate <NSObject>

- (void)imageViewTapClick:(NSInteger)cellIndex;

@end

@interface LYQuestionOneCell : UITableViewCell

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, assign) CGFloat      cellHeight;

@property (nonatomic, assign) NSInteger    cellIndex;

@property (nonatomic, weak)   id <LYFourTableViewCellDelegate> delegate;

- (void)setImageForImgView:(UIImage *)image;

@end
