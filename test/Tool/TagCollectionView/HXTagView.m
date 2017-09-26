//
//  HXTagView.m
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXTagView.h"
#import "HXTagViewCell.h"
@implementation HXTagView

+ (instancetype)hxTagView
{
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    HXTagView *hx = [[HXTagView alloc] initWithFrame:CGRectMake(0, 20,  [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:flowLayout];
    
    hx.allowsMultipleSelection = NO;      //实现多选，默认是NO
    hx.backgroundColor = [UIColor whiteColor];
    
    UINib *nib = [UINib nibWithNibName:@"HXTagViewCell" bundle:[NSBundle mainBundle]];
    [hx registerNib:nib forCellWithReuseIdentifier:@"tagviewCell"];
    [hx registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [hx registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
    return hx;
}

@end

@implementation HXTagHeaderView

+ (instancetype)hxTagHeaderView:(UICollectionView *)collecView index:(NSIndexPath *)indexPath
{
    HXTagHeaderView *views = [collecView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(10, 8, 70, 30);
    label.font = [UIFont systemFontOfSize:14.0f];
    label.textColor = [UIColor orangeColor];
    label.text = [NSString stringWithFormat:@"label"];
    
    [views addSubview:label];
    return views;
}


@end
