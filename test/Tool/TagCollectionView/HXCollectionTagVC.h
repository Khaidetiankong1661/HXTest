//
//  HXCollectionTagVC.h
//  test
//
//  Created by hongbaodai on 2017/9/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, HXLayouStyle){
    /** 不自适应，固定一行几个 */
    HXLayouStyleDefault,
     /** 根据每个字段自适应排版 */
    HXLayouStyleTadaptation
};

@interface HXCollectionTagVC : UIViewController

/**
 每行显示排版问题
 */
@property (nonatomic, assign) HXLayouStyle hxLayoutStyle;



@end
