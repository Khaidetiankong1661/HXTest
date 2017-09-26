
//
//  CustomerServiceVC.m
//  test
//
//  Created by hongbaodai on 2017/9/22.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "CustomerServiceVC.h"

@interface CustomerServiceVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation CustomerServiceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%ld",(long)indexPath.row);
    if (indexPath.row == 0) {
        
    } else if (indexPath.row == 1) {
        
    } else if (indexPath.row == 2) {
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
