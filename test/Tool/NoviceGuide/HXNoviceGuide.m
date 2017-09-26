
//
//  HXNoviceGuide.m
//  test
//
//  Created by hongbaodai on 2017/9/11.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "HXNoviceGuide.h"

@implementation HXNoviceGuide

+(instancetype)hxNoviceGuide
{
    HXNoviceGuide *noviceGuide = [[HXNoviceGuide alloc] init];
    noviceGuide.backgroundColor = [UIColor clearColor];
    [noviceGuide newUserGuide];
    return noviceGuide;
}

- (void)newUserGuide
{
    
    // 这里创建指引在这个视图在window上
    CGRect frame = [UIScreen mainScreen].bounds;
    UIView * bgView = [[UIView alloc]initWithFrame:frame];
    bgView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(sureTapClick:)];
    [bgView addGestureRecognizer:tap];
    [[UIApplication sharedApplication].keyWindow addSubview:bgView];
    
    //create path 重点来了（**这里需要添加第一个路径）
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:frame];
    // 这里添加第二个路径 （这个是圆）
    [path appendPath:[UIBezierPath bezierPathWithArcCenter:CGPointMake(frame.size.width - 30, 42) radius:30 startAngle:0 endAngle:2*M_PI clockwise:NO]];
    // 这里添加第二个路径 （这个是矩形）
    [path appendPath:[[UIBezierPath bezierPathWithRoundedRect:CGRectMake(frame.size.width/2.0-1, 234, frame.size.width/2.0+1, 55) cornerRadius:5] bezierPathByReversingPath]];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor blueColor].CGColor;
    [bgView.layer setMask:shapeLayer];
    
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width -300,72,270, 137)];
    imageView.image = [UIImage imageNamed:@"04"];
    [bgView addSubview:imageView];
    
}

/**
 *   新手指引确定
 */
- (void)sureTapClick:(UITapGestureRecognizer *)tap
{
    UIView * view = tap.view;
    [view removeFromSuperview];
    [view removeGestureRecognizer:tap];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstCouponBoard_iPhone"];
}



@end
