//
//  HelpCenterVC.m
//  test
//
//  Created by hongbaodai on 2017/9/22.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HelpCenterVC.h"
#import "HXWebVC.h"

@interface HelpCenterVC ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *dataArr;
    NSArray *titleArr;
}

@property (nonatomic, strong)HXWebVC *webVC;

@end

@implementation HelpCenterVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    dataArr = @[@"******", @"网址*******", @"网址*******", @"网址*******", @"网址*******", @"网址*******"];
    titleArr = @[@"注册与登录", @"认证与安全", @"充值与体现", @"投资交易", @"法律保障", @"名词解释"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    self.webVC = dataArr[indexPath.row];
    self.webVC.title = titleArr[indexPath.row];
    [self.navigationController pushViewController:self.webVC animated:YES];
}

- (HXWebVC *)webVC
{
    if (_webVC == nil) {
        _webVC = [[HXWebVC alloc] init];
    }
    return _webVC;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
