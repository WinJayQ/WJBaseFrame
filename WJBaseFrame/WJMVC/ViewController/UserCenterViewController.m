//
//  UserCenterViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UIView+RoundCorner.h"
#import "UIImageView+RoundCorner.h"
#import "UIImage+RoundCorner.h"
#import "UIView+ImageSnapshot.h"
#import "AFNNetworkAdapter.h"


@interface UserCenterViewController ()

@end

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftItemHidden = YES;
    [self.navigationItem setHidesBackButton:YES]; //隐藏导航栏返回按钮
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201506/07/20150607125257_T2RvC.png"]
                        placeholderImage:[UIImage imageNamed:@"10.png"]
                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                   NSLog(@"完成");
                                   //image=[self.view screenShot];
                                   [self.myImageView setImage:[image imageWithCornerRadius:image.size.width/2]];
                               }];
    // [self.myImageView rasterizeCorner];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(120, 350, 80, 80)];
    button.backgroundColor = [UIColor orangeColor];
    [button avatarCorner];
    
    [self.view addSubview:button];
    
    //  [self.view showCustomDialog];
    
    [self loadCarBrandData];
}

#pragma mark - 获取汽车品牌
- (void)loadCarBrandData{
    if (self.isLoading == YES) {
        return;
    }else{
        self.isLoading = YES;
        [self showLoadingStatus:@""];
    }
    
    //汽车品牌接口
    NSString *urlString = [kServerURL stringByAppendingString:@"/car/getcarbrand"];
    
    [AFNNetworkAdapter requestWithURL:urlString params:nil method:AFNRequestMethodGet success:^(AFHTTPRequestOperation *operation,id response) {
        NSLog(@"%ld",(long)operation.response.statusCode);
        NSLog(@"%@",response);
        self.isLoading = NO;
        [self hideLoading];
    } fail:^(AFHTTPRequestOperation *operation,NSError *error) {
        NSLog(@"%@",error);
        self.isLoading = NO;
        [self hideLoading];
    }];
    
}


@end
