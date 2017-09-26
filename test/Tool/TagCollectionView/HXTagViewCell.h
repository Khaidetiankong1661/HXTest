//
//  HXTagViewCell.h
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXTagViewCell : UICollectionViewCell

+ (instancetype)hxTagViewCellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)index;

- (void)makeTitleWithstr:(NSString *)str;

- (void)reloadDataWithdata:(NSIndexPath *)index selecStr:(NSString *)selecStr;

@end
