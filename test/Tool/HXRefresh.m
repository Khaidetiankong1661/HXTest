//  HXRefresh.m
//  test
//
//  Created by hongbaodai on 2017/8/3.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXRefresh.h"
#import <MJRefresh.h>

@implementation HXRefresh

/** 设置头部的刷新 */
+ (void)setHeaderRefresnWithVC:(UIViewController *)viewController tableView:(UITableView *)tableView headerAction:(SEL)action
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:viewController refreshingAction:action];
    tableView.mj_header = header;
}

/** 设置头部和尾部刷新：无动画 */
+ (void)setHeaderAndFooterRefreshWithVC:(UIViewController *)viewController tableView:(UITableView *)tableView headerAction:(SEL)headerAction footerAction:(SEL)footerAction
{
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:viewController refreshingAction:headerAction];
    MJRefreshBackStateFooter *footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:viewController refreshingAction:footerAction];
    [footer setTitle:@"点击加载更多哦~~" forState:MJRefreshStateIdle];
    [footer setTitle:@"点击加载更多哦~~" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在奋力加载哦哦~~" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经到底了~~" forState:MJRefreshStateNoMoreData];
    
    tableView.mj_header = header;
    tableView.mj_footer = footer;
}

/** 只设置footer加载：无动画 */
+ (void)setFooterRefreshWithVC:(UIViewController *)viewController tableView:(UITableView *)tableView footerAction:(SEL)footerAction
{
    MJRefreshBackStateFooter *footer = [MJRefreshBackStateFooter footerWithRefreshingTarget:viewController refreshingAction:footerAction];
    [footer setTitle:@"点击加载更多哦~~" forState:MJRefreshStateIdle];
    [footer setTitle:@"点击加载更多哦~~" forState:MJRefreshStatePulling];
    [footer setTitle:@"正在奋力加载哦哦~~" forState:MJRefreshStateRefreshing];
    [footer setTitle:@"已经到底了~~" forState:MJRefreshStateNoMoreData];
    
    tableView.mj_footer = footer;
}





@end
