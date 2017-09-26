//
//  HXTagViewCell.m
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXTagViewCell.h"
/** 文字背景-普通状态下 */
#define titleLabelBackNomorColor [UIColor lightGrayColor]
/** 文字背景-点击状态下 */
#define titleLabelBackSelectColor [UIColor redColor]

@interface HXTagViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end

@implementation HXTagViewCell

+ (instancetype)hxTagViewCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)index
{
    static NSString *cellId = @"tagviewCell";

    HXTagViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:index];
    cell.titleLabel.backgroundColor = titleLabelBackNomorColor;

    return cell;
}

- (void)makeTitleWithstr:(NSString *)str
{
    self.titleLabel.text = str;
}

- (void)reloadDataWithdata:(NSIndexPath *)index selecStr:(NSString *)selecStr
{
    if ([selecStr isEqualToString:@"2"]) {
        self.titleLabel.backgroundColor = titleLabelBackSelectColor;
        
    } else if ([selecStr isEqualToString:@"3"]) {
        
        self.titleLabel.backgroundColor = titleLabelBackNomorColor;

    }
}

@end
