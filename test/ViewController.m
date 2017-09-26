//
//  ViewController.m
//  test
//
//  Created by hongbaodai on 2017/7/28.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "ViewController.h"
#import "Alert.h"
#import <Udesk.h>

#import "HXProgressTool.h"
#import "HXNoviceGuide.h"
#import "CuViewController.h"

@interface ViewController ()
{
    NSInteger cout;

}

@property (assign, nonatomic) BOOL isSelect;
@property (atomic, strong) NSTimer *timer;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 自定义引导图
//    HXNoviceGuide *view = [HXNoviceGuide hxNoviceGuide];
//    [self.view addSubview:view];

}

- (IBAction)doSome:(id)sender
{
//    button111
  

    [self didBezier];
}

- (void)didBezier
{
 
//    UIBezierPath *be = [UIBezierPath bezierPathWithArcCenter:self.view.center radius:(self.view.frame.size.width - 0.7)/ 2 startAngle:0 endAngle:M_PI *2 clockwise:YES];
//    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
//    [self.view.layer addSublayer:layer];
//    layer.path = be.CGPath;
//    layer.lineWidth = 50;
//    layer.fillColor = nil;
//    layer.strokeColor = [UIColor cyanColor].CGColor;
//    
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
//    animation.fillMode = kCAFillModeForwards;
//    //运行一次是否移除动画
//    animation.removedOnCompletion = NO;
////    layer.frame = self.view.bounds;
//    animation.fromValue = @(0.f);
//    animation.toValue = @(1.f);
//    animation.duration = 1.0f;
//    [layer addAnimation:animation forKey:nil];
    
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 280)];
    
    path.lineWidth = 5.0;
    path.lineCapStyle = kCGLineCapRound; //线条拐角
    path.lineJoinStyle = kCGLineJoinRound; //终点处理
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    [self.view.layer addSublayer:layer];
    layer.path = path.CGPath;

    
    [path stroke];
    
    

}

- (IBAction)button222:(id)sender {

}

- (void)doUdesk
{
    //此处只是示例:自定义UI，更多UI参数请参看 UdeskSDKStyle.h
    UdeskSDKStyle *sdkStyle = [UdeskSDKStyle customStyle];
    sdkStyle.navigationColor = [UIColor yellowColor];
    sdkStyle.titleColor = [UIColor orangeColor];
    
    UdeskSDKManager *chat = [[UdeskSDKManager alloc] initWithSDKStyle:[UdeskSDKStyle defaultStyle]];
    
    //    //自定义留言回调
    //    [chat leaveMessageButtonAction:^(UIViewController *viewController){
    //        CuViewController *mevieVC = [[CuViewController alloc] init];
    //        [viewController presentViewController:mevieVC animated:YES completion:nil];
    //
    //    }];
    // UdeskChatViewController
    //如果用户处于排队状态，当用户离开聊天界面，会强制把该用户移除排队
    //默认为标记排队（指不会放弃排队）
    [chat setQuitQueueType:UdeskForceQuit];
    // 自定义cell
    NSDictionary *dict = @{
                           @"productImageUrl":@"https://img.club.pchome.net/kdsarticle/2013/11small/21/fd548da909d64a988da20fa0ec124ef3_1000x750.jpg",
                           @"productTitle":@"测试测试测试测你测试测试测你测试测试测你测试测试测你测试测试测你测试测试测你！",
                           @"productDetail":@"¥88888.088888.088888.0",
                           @"productURL":@"http://www.baidu.com"
                           };
    [chat setProductMessage:dict];
    //设置用户头像：通过URL设置头像
    //    [chat setCustomerAvatarWithURL:@"头像URL"];
    //通过本地图片设置头像
    //    [chat setCustomerAvatarWithImage:[UIImage imageNamed:@"02"]];
    
    
    //    [UdeskManager setupCustomerOnline];
    
    [chat pushUdeskInViewController:self completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
