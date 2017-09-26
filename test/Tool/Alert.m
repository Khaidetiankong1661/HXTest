//
//  Alert.m
//  test
//
//  Created by hongbaodai on 2017/8/2.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "Alert.h"

@implementation Alert

+ (void)creatAlertWithVC:(UIViewController *)vc title:(NSString *)titleStr messageStr:(NSString *)messageStr enSureBlock:(Ensure)ensureBlo cancelBlock:(Cancel)cancelBlc
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:titleStr message:messageStr preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        ensureBlo();
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        [vc dismissViewControllerAnimated:YES completion:nil];
        cancelBlc();
        
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [vc presentViewController:alert animated:YES completion:nil];

}




@end
