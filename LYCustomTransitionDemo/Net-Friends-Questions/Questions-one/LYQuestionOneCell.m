//
//  LYQuestionOneCell.m
//  LYCustomTransitionDemo
//
//  Created by 李阳 on 2017/6/15.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYQuestionOneCell.h"

@implementation LYQuestionOneCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatUI];
    }
    return self;
}

- (void)creatUI{
    self.backgroundColor = [UIColor colorWithRed:0.1 green:0.7 blue:0.4 alpha:1];
    
//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
//    [self.contentView addGestureRecognizer:tap];
    
    _imgView = [[UIImageView alloc] init];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    _imgView.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:_imgView];
}

- (void)setImageForImgView:(UIImage *)image{
    CGSize size = [self backImageNewSize:image.size];
    _imgView.frame = CGRectMake(16, 0, size.width, size.height);
    _imgView.image = image;
    _cellHeight = size.height + 40;
}

- (CGSize)backImageNewSize:(CGSize)size{
    
    CGSize newSize;
    newSize.height = 200;
    newSize.width = newSize.height / size.height * size.width;
    
    return newSize;
}
- (void)tapClick{
    if (_delegate && [_delegate respondsToSelector:@selector(imageViewTapClick:)]) {
        [_delegate imageViewTapClick:_cellIndex];
    }
}

@end

