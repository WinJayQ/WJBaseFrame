//
//  FourthViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "MovieViewController.h"
#import "LocalVideoViewController.h"
#import "WebVideoViewController.h"

@interface MovieViewController ()

@end

@implementation MovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftItemHidden = YES;
    self.title = @"Movie";
    [self.playLocalBtn setCorner:5];
    [self.playWebBtn setCorner:5];
    self.playLocalBtn.backgroundColor = [UIColor blueColor];
    self.playWebBtn.backgroundColor = [UIColor greenColor];
}


- (IBAction)playLocalVideo:(id)sender {
    LocalVideoViewController *localVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LocalVC"];
     localVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:localVC animated:YES];
}

- (IBAction)playWebVideo:(id)sender {
    WebVideoViewController *webVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebVideoVC"];
    NSString *str = @"http://v.youku.com/v_show/id_XODY5ODgzNTI4.html?qq-pf-to=pcqq.c2c";
    webVC.videoURL = [NSURL URLWithString:str];
    webVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webVC animated:YES];
}
@end
