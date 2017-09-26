//
//  CYTeachRankingSwitchVC.m
//  LingLingBang
//
//  Created by whx on 2017/6/1.
//  Copyright © 2017年 linglingbang. All rights reserved.
//

#import "CYTeachRankingSwitchVC.h"
#import "CYTeachRankingListVC.h"
#define kMagicViewHieght 40.0
#define kMagicColor @"60a7ff"

@interface CYTeachRankingSwitchVC ()
/** 是否是技师 */
@property (nonatomic, assign) BOOL teachArea;
/** MagicView数据 */
@property (nonatomic, strong)NSArray *dataArr;
@property (nonatomic, weak)CYTeachRankingListVC *vc1;
@property (nonatomic, weak)CYTeachRankingListVC *vc2;


@end

@implementation CYTeachRankingSwitchVC
/**
 初始化CYTeachRankingSwitchVC
 
 @param teaArea 是否是技师
 @return self
 */
- (instancetype)initWithteach:(BOOL)teaArea
{
    if (self = [super init]) {
        self.teachArea = teaArea;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setData];
    [self setUI];
}
- (void)setData
{
    _dataArr = [NSArray arrayWithObjects:@"回复榜", @"采纳榜", nil];
}
- (void)setUI
{
    self.magicView.itemScale = 1.0;
    self.magicView.navigationColor = [UIColor whiteColor];
    self.magicView.sliderColor = [UIColor redColor];
    self.magicView.sliderHeight = 3.0;
    self.magicView.sliderExtension = 0;
    self.magicView.layoutStyle = VTLayoutStyleDivide;
    self.magicView.switchStyle = VTSwitchStyleDefault;
    self.magicView.navigationHeight = kMagicViewHieght;
    self.magicView.headerHeight = 40.0;
    self.magicView.separatorHidden = NO;
    self.magicView.separatorColor = [UIColor cyanColor];
    self.magicView.againstStatusBar = NO;
    self.magicView.dataSource = self;
    self.magicView.delegate = self;
    

    [self.magicView reloadData];
}
#pragma mark - VTMagicViewDataSource
- (NSArray<NSString *> *)menuTitlesForMagicView:(VTMagicView *)magicView
{
    return _dataArr;
}
- (UIButton *)magicView:(VTMagicView *)magicView menuItemAtIndex:(NSUInteger)itemIndex
{
    static NSString *itemIdentifier = @"itemIdentifier";
    UIButton *menuItem = [magicView dequeueReusableItemWithIdentifier:itemIdentifier];
    if (!menuItem) {
        menuItem = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuItem setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [menuItem setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
        menuItem.titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return menuItem;
}
- (UIViewController *)magicView:(VTMagicView *)magicView viewControllerAtPage:(NSUInteger)pageIndex
{
    if (0 == pageIndex) {
        static NSString *identifier = @"CYTeachRankingListVC1.identifier";
        CYTeachRankingListVC *VC1 = [magicView dequeueReusablePageWithIdentifier:identifier];
        if (!VC1) {
            VC1 = [[CYTeachRankingListVC alloc] init];
            VC1.view.backgroundColor = [UIColor whiteColor];
//            [self makeUserRoleWithVc:VC1];
//            VC1.rankingLsit = RankingListRepay;
            self.vc1 = VC1;
        }
        return VC1;
    }
    if (1 == pageIndex) {
        static NSString *identifier = @"CYTeachRankingListVC2.identifier";
        CYTeachRankingListVC *VC2 = [magicView dequeueReusablePageWithIdentifier:identifier];
        if (!VC2) {
            VC2 = [[CYTeachRankingListVC alloc] init];
            VC2.view.backgroundColor = [UIColor orangeColor];

//            [self makeUserRoleWithVc:VC2];
//            VC2.rankingLsit = RankingListAccept;
            self.vc2 = VC2;
        }
        return VC2;
    }
    
    if (2 == pageIndex) {
        static NSString *identifier = @"CYTeachRankingListVC2.identifier";
        CYTeachRankingListVC *VC2 = [magicView dequeueReusablePageWithIdentifier:identifier];
        if (!VC2) {
            VC2 = [[CYTeachRankingListVC alloc] init];
            VC2.view.backgroundColor = [UIColor whiteColor];
            
            //            [self makeUserRoleWithVc:VC2];
            //            VC2.rankingLsit = RankingListAccept;
            self.vc2 = VC2;
        }
        return VC2;
    }
    if (3 == pageIndex) {
        static NSString *identifier = @"CYTeachRankingListVC2.identifier";
        CYTeachRankingListVC *VC2 = [magicView dequeueReusablePageWithIdentifier:identifier];
        if (!VC2) {
            VC2 = [[CYTeachRankingListVC alloc] init];
            VC2.view.backgroundColor = [UIColor orangeColor];
            
            //            [self makeUserRoleWithVc:VC2];
            //            VC2.rankingLsit = RankingListAccept;
            self.vc2 = VC2;
        }
        return VC2;
    }
    return nil;
}
/** 赋值角色 */
//- (void)makeUserRoleWithVc:(CYTeachRankingListVC *)listVC
//{
//    if (self.teachArea == YES) {
//        listVC.userRole = UserRoleTeachArea;
//    } else {
//        listVC.userRole = UserRoleCommon;
//    }
//}
///** 用户点击周排行和月排行 */
//- (void)setTeachRankingWith:(TeachRangking)teachRanking
//{
//    self.vc1.teachRanking = teachRanking;
//    self.vc2.teachRanking = teachRanking;
//
//    if (teachRanking == TeachRangkingWeek) {
//        [self.magicView switchToPage:0 animated:YES];
//        [self.vc1 setData];
//
//    } else if (teachRanking == TeachRangkingMouth) {
//        [self.magicView switchToPage:0 animated:YES];
//        [self.vc1 setData];
//    }
//}
#pragma mark - view处理
/** view 处理 */
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)viewDidAppear:(BOOL)animated
{
    [self.magicView switchToPage:0 animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
