//
//  GamesViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "GamesViewController.h"
#import "WebGamesViewController.h"

@interface GamesViewController ()

@end

@implementation GamesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftItemHidden = YES;
    self.title = @"Game";
    self.view.backgroundColor = [[UIColor alloc]initWithPatternImage:[UIImage imageNamed:@"zj.jpg"]];
    
    [self.playBtn setCorner:15];
    self.playBtn.backgroundColor = [UIColor greenColor];
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

- (IBAction)PlayGames:(id)sender {
    WebGamesViewController *webGameVC = [self.storyboard instantiateViewControllerWithIdentifier:@"WebGameVC"];
    webGameVC.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:webGameVC animated:YES];
}
@end
