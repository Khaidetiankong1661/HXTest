//  HXCollectionTagVC.m
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXCollectionTagVC.h"
#import "HXTagView.h"
#import "HXTagViewCell.h"

#define kItemHeight 26
#define kMinimumLineSpacing 5
#define kMinimumInteritemSpacing 5

#define kSectionEdgeInsetsLeft 15
#define kSectionEdgeInsetsBottom 0
#define kSectionEdgeInsetsTop 5
#define kSectionEdgeInsetsRight 15
#define kMarginTop 134

@interface HXCollectionTagVC ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    NSInteger sectionCout;
    NSString *select; // 1:没有点击 2:点击 3：取消点击
}
@property (nonatomic, strong) HXTagView *tagView;
// 数据
@property (nonatomic, strong) NSArray *dataArr;
// 选中数组
@property (nonatomic, strong) NSMutableArray *selectArr;

@end

@implementation HXCollectionTagVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArr = @[@"帅气",@"完美大人",@"好给力",@"好厉害",@"编程高手",@"设计师",@"有品位",@"色彩玩家",@"颜值高",@"善于沟通",@"牛逼闪闪",@"哈哈",@"潜力股",@"富二代",@"跑车一族",@"牛叉",@"萝莉控",@"爱喝啤酒吃烧烤",@"外星人啦啦啦啦啦啦啦",@"妹子",@"妞妞dfalslkdf lskdjflsk",@"瓦窑",@"丽丽",@"土豪",@"冲锋枪啊",];
    

    sectionCout = 3;
    self.tagView = [HXTagView hxTagView];
    self.tagView.dataSource = self;
    self.tagView.delegate = self;
    select = @"1";
    [self.view addSubview:self.tagView];
    
}

#pragma mark- UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return sectionCout;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (_dataArr) {
        return _dataArr.count;
    }
    return 0;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (!self.dataArr) {
        return nil;
    }
    HXTagViewCell *cell = [HXTagViewCell hxTagViewCellWithCollectionView:collectionView indexPath:indexPath];
    [cell makeTitleWithstr:self.dataArr[indexPath.row]];
    // 点击后进行刷新
    if (![select isEqualToString:@"1"]) {
        [cell reloadDataWithdata:self.selectArr[indexPath.section] selecStr:select];
    }
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        HXTagHeaderView *headerView = [HXTagHeaderView hxTagHeaderView:collectionView index:indexPath];
        return headerView;
    }
    return nil;
}

#pragma mark- UICollectionViewDelegateFlowLayout
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets inset = UIEdgeInsetsMake(kSectionEdgeInsetsTop, kSectionEdgeInsetsLeft, 5, kSectionEdgeInsetsRight);
    return inset;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return kMinimumLineSpacing;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return kMinimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.hxLayoutStyle == HXLayouStyleTadaptation) {
        
        CGSize size = CGSizeZero;
        NSString *str = self.dataArr[indexPath.row];
        size = [self calculateCellSize:str];
        return size;
    }
    return CGSizeMake(90, 116);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
//    if (section == 0) {
//        return CGSizeMake(0, CGFLOAT_MIN);
//    }
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, 50);
}

#pragma mark- UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self selectIndex:indexPath];
}

- (void)selectIndex:(NSIndexPath *)indexPath
{
    NSString *str = self.selectArr[indexPath.section];
    if (!(str.length > 0)) {
        // 每行第一次点击时
        select = @"2";
        [self.tagView reloadItemsAtIndexPaths:@[indexPath]];
        self.selectArr[indexPath.section] = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
        return;
    }
    // 点击同一个按钮
    if (indexPath.row == [str integerValue]) {
        [self cancelLastSelectWithStr:str index:indexPath];
        return;
    }
    // 取消上次点击
    [self cancelLastSelectWithStr:str index:indexPath];
    // 执行本次点击
    [self makeSelectWithIndex:indexPath];
}

- (void)cancelLastSelectWithStr:(NSString *)str index:(NSIndexPath *)indexPath
{
    select = @"3";
    NSIndexPath *indexOld = [NSIndexPath indexPathForItem:[str integerValue] inSection:indexPath.section];
    [self.tagView reloadItemsAtIndexPaths:@[indexOld]];
    self.selectArr[indexPath.section] = @"";
}

- (void)makeSelectWithIndex:(NSIndexPath *)indexPath
{
    select = @"2";
    [self.tagView reloadItemsAtIndexPaths:@[indexPath]];
    self.selectArr[indexPath.section] = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
}

#warning 这个在项目里需要用工具里的方法，不需要单独写
//计算cell size
-(CGSize)calculateCellSize:(NSString *)content{
    CGSize size = [content sizeWithFont:[UIFont systemFontOfSize:12] constrainedToSize:CGSizeMake(MAXFLOAT, kItemHeight) lineBreakMode:NSLineBreakByCharWrapping];
    size.height = kItemHeight;
    size.width = floorf(size.width+20);
    return size;
}

- (NSMutableArray *)selectArr
{
    if (_selectArr == nil) {
        _selectArr = [NSMutableArray array];
        if (sectionCout) {
            for (int i = 0; i < sectionCout; i ++) {
                NSString *numStr = @"";
                [_selectArr addObject:numStr];
            }
        }
    }
    return _selectArr;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
//    NSLog(@"===%@",_selectArr);
}

@end
