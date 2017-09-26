//
//  CYTeachRankingSwitchVC.h
//  LingLingBang
//
//  Created by whx on 2017/6/1.
//  Copyright © 2017年 linglingbang. All rights reserved.
//

#import "VTMagicController.h"

typedef NS_ENUM(NSInteger, TeachRangking) {
    // 周排行
    TeachRangkingWeek,
    // 月排行
    TeachRangkingMouth
};
//#import "CYTechAreaModel.h"

@interface CYTeachRankingSwitchVC : VTMagicController
/**
 初始化CYTeachRankingSwitchVC

 @param teaArea 是否是技师
 @return self
 */
- (instancetype)initWithteach:(BOOL)teaArea;
/**
 用户点击周排行和月排行

 @param teachRanking TeachRangking
 */
- (void)setTeachRankingWith:(TeachRangking)teachRanking;



@end

