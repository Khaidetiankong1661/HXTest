//
//  CYTeachRankingListVC.m
//  test
//
//  Created by hongbaodai on 2017/8/7.
//  Copyright © 2017年 hongbaodai. All rights reserved.
//

#import "CYTeachRankingListVC.h"

#import <UMSocialCore/UMSocialCore.h>

#import "HXCollectionTagVC.h"

@interface CYTeachRankingListVC ()
@end

@implementation CYTeachRankingListVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/** uicollectionview */










- (IBAction)doaCtion:(id)sender {
    
    HXCollectionTagVC *vc = [[HXCollectionTagVC alloc] init];
    vc.hxLayoutStyle = HXLayouStyleTadaptation;
    [self.navigationController pushViewController:vc animated:YES];

//    [self shareWebPageToPlatformType:UMSocialPlatformType_WechatSession];
    
}

- (IBAction)cricle:(id)sender {
    [self shareWebPageToPlatformType:UMSocialPlatformType_WechatTimeLine];

}

//分享文本
- (void)shareTextToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    //设置文本
    messageObject.text = @"哈哈哈";

    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {

        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
//        [self alertWithError:error];
    }];
   
}

//网页分享
- (void)shareWebPageToPlatformType:(UMSocialPlatformType)platformType
{
    //创建分享消息对象
    UMSocialMessageObject *messageObject = [UMSocialMessageObject messageObject];
    
    //创建网页内容对象
    NSString* thumbURL =  @"https://mobile.umeng.com/images/pic/home/social/img-1.png";
    UMShareWebpageObject *shareObject = [UMShareWebpageObject shareObjectWithTitle:@"title：文章" descr:@"这是一篇伟大的篇章，详解，这是" thumImage:thumbURL];
    //设置网页地址
    shareObject.webpageUrl = @"https://www.hongbaodai.com/m/mPage/wapJulyEvent1/wapJulyEvent1.html?t=30d0479b10c37d4a4329c893d5d6d041&u=117229&nickname=13141151513&roles=1&hidden=1";
    
    //分享消息对象设置分享内容对象
    messageObject.shareObject = shareObject;
    
    //调用分享接口
    [[UMSocialManager defaultManager] shareToPlatform:platformType messageObject:messageObject currentViewController:self completion:^(id data, NSError *error) {
        if (error) {
            UMSocialLogInfo(@"************Share fail with error %@*********",error);
        }else{
            if ([data isKindOfClass:[UMSocialShareResponse class]]) {
                UMSocialShareResponse *resp = data;
                //分享结果消息
                UMSocialLogInfo(@"response message is %@",resp.message);
                //第三方原始返回的数据
                UMSocialLogInfo(@"response originalResponse data is %@",resp.originalResponse);
                
            }else{
                UMSocialLogInfo(@"response data is %@",data);
            }
        }
        //            [self alertWithError:error];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
