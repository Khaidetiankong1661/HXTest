//
//  Alert.h
//  test
//
//  Created by hongbaodai on 2017/8/2.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^Ensure) (void);
typedef void (^Cancel) (void);


@interface Alert : NSObject<UIAlertViewDelegate>


/**
 确认按钮回调
 */
@property(nonatomic, copy) Ensure ensureBlock;

/**
 取消按钮回调
 */
@property(nonatomic, copy) Cancel cancelBlock;

+ (void)creatAlertWithVC:(UIViewController *)vc title:(NSString *)titleStr messageStr:(NSString *)messageStr enSureBlock:(Ensure)ensureBlo cancelBlock:(Cancel)cancelBlc;

@end
