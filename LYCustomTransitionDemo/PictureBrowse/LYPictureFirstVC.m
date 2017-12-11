//
//  LYPictureFirstVC.m
//  LYCustomTransitionDemo
//
//  Created by liyang on 2017/12/5.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "LYPictureFirstVC.h"
#import "LYPictureFirstPageCell.h"

#import "LYPictureBrowse.h"

#define CellImageSize (kScreenWidth - 2 * 5)/ 3.0

@interface LYPictureFirstVC ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate, UINavigationControllerDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray   *imageDataArray;

@property (nonatomic, strong) NSMutableArray   *pictureImageViews;
@property (nonatomic, strong) LYPictureBrowseInteractiveAnimatedTransition *animatedTransition;

@end

@implementation LYPictureFirstVC

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    self.navigationController.delegate = nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor blackColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self initImageData];
    
    [self.view addSubview:self.collectionView];
}

- (void)initImageData{
    
    self.imageDataArray = [NSMutableArray array];
    
    //构造图片数据
    for (int i = 1; i <= 11; i ++) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Expression%.2d",i] ofType:@"jpeg"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        
        NSDictionary *imgDic = @{@"image" : img,
                                 //@"imgUrl" : [NSString stringWithFormat:@"https://xxx.jpg",i],
                                 //@"imgUrl_thumb" : [NSString stringWithFormat:@"https://xxx_thumb.jpg",i]
                                 };
        
        [self.imageDataArray addObject:imgDic];
    }
    //构造图片数据
    for (int i = 1; i <= 11; i ++) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"Expression%.2d",i] ofType:@"jpeg"];
        UIImage *img = [UIImage imageWithContentsOfFile:path];
        
        NSDictionary *imgDic = @{@"image" : img,
                                 //@"imgUrl" : [NSString stringWithFormat:@"https://xxx.jpg",i],
                                 //@"imgUrl_thumb" : [NSString stringWithFormat:@"https://xxx_thumb.jpg",i]
                                 };
        
        [self.imageDataArray addObject:imgDic];
    }
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.imageDataArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *imgDic = _imageDataArray[indexPath.row];
    LYPictureFirstPageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([LYPictureFirstPageCell class]) forIndexPath:indexPath];
    cell.imageView.image = imgDic[@"image"];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGSize size = CGSizeMake(CellImageSize, CellImageSize);
    
    return size;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LYPictureFirstPageCell * cell = (LYPictureFirstPageCell *)[_collectionView cellForItemAtIndexPath:indexPath];
    
    NSInteger index = indexPath.row;
    
    //封装参数对象
    LYPictureBrowseTransitionParameter *transitionParameter = [[LYPictureBrowseTransitionParameter alloc] init];
    transitionParameter.transitionImage = cell.imageView.image;
    transitionParameter.firstVCImgFrames = [self firstImageViewFrames];
    transitionParameter.transitionImgIndex = index;
    self.animatedTransition = nil;
    self.animatedTransition.transitionParameter = transitionParameter;

    //传输必要参数
    LYPictureBrowseViewController *pictVC = [[LYPictureBrowseViewController alloc] init];
    pictVC.dataSouceArray = [self browseSouceModelItemArray];
    pictVC.animatedTransition = self.animatedTransition;

    //设置代理
    pictVC.transitioningDelegate = self.animatedTransition;
    [self presentViewController:pictVC animated:YES completion:nil];
    

//    ///无交互动画方式
//    LYPictureBrowseViewController *pictVC = [[LYPictureBrowseViewController alloc] init];
//    pictVC.dataSouceArray = [self browseSouceModelItemArray];
//    [self presentViewController:pictVC animated:YES completion:nil];
    
}

#pragma mark - Setter and getter
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        flowLayout.sectionInset = UIEdgeInsetsMake(10, 0, 0, 0);
        flowLayout.minimumLineSpacing = 5;
        flowLayout.minimumInteritemSpacing = 5;
        
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight - 64) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.alwaysBounceVertical = YES;
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[LYPictureFirstPageCell class] forCellWithReuseIdentifier:NSStringFromClass([LYPictureFirstPageCell class])];
    }
    return _collectionView;
}

- (LYPictureBrowseInteractiveAnimatedTransition *)animatedTransition{
    if (!_animatedTransition) {
        _animatedTransition = [[LYPictureBrowseInteractiveAnimatedTransition alloc] init];
    }
    return _animatedTransition;
}

- (NSMutableArray *)pictureImageViews {
    if (!_pictureImageViews) {
        _pictureImageViews = [[NSMutableArray alloc] init];
    }
    return _pictureImageViews;
}

#pragma mark - Custom
//构造图片Frame数组
- (NSArray<NSValue *> *)firstImageViewFrames{
    
    NSMutableArray *imageFrames = [NSMutableArray new];
    for (int i = 0; i < _imageDataArray.count; i ++) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        LYPictureFirstPageCell * cell = (LYPictureFirstPageCell *)[_collectionView cellForItemAtIndexPath:indexPath];
        
        if (cell.imageView) {
            //获取当前view在Window上的frame
            CGRect frame = [self getFrameInWindow:cell.imageView];
            [imageFrames addObject:[NSValue valueWithCGRect:frame]];
            
        }else{//当前不可见的cell,frame设为CGRectZero添加到数组中,防止数组越界
            CGRect frame = CGRectZero;
            [imageFrames addObject:[NSValue valueWithCGRect:frame]];
        }
    }

    return imageFrames;
}

//构造图片模型数组
- (NSArray<LYPictureBrowseSouceModel *> *)browseSouceModelItemArray{
    
    NSMutableArray *models = [NSMutableArray new];
    for (NSDictionary *imgDic in self.imageDataArray) {
        
        LYPictureBrowseSouceModel *model = [[LYPictureBrowseSouceModel alloc] init];
        model.imgUrl = imgDic[@"imgUrl"];
        model.imgUrl_thumb = imgDic[@"imgUrl_thumb"];
        model.image = imgDic[@"image"];
        [models addObject:model];
    }
    return models;
}
// 获取指定视图在window中的位置
- (CGRect)getFrameInWindow:(UIView *)view
{
    return [view.superview convertRect:view.frame toView:nil];
}
@end

