//
//  HXTagView.h
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXTagView : UICollectionView

+ (instancetype)hxTagView;

@end


@interface HXTagHeaderView : UICollectionReusableView

+ (instancetype)hxTagHeaderView:(UICollectionView *)collecView index:(NSIndexPath *)indexPath;
@end
