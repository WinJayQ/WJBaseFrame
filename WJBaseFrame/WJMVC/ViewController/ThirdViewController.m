//
//  ThirdViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "ThirdViewController.h"
#import "HWPopTool.h"
#import "UIView+RoundCorner.h"

@interface ThirdViewController ()
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIButton *popBtn;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftItemHidden = YES;
    
    _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    _contentView.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 200, 200, 50);
    btn.center = self.view.center;
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"恭喜发财，大吉大利！" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(popViewShow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    _popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    CGPoint temp = _contentView.center;
    temp.y += 32;
    _popBtn.frame = CGRectMake(0, 0, 80, 80);
    _popBtn.center = temp;
    [_popBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [_popBtn setTitle:@"拆红包" forState:UIControlStateNormal];
    _popBtn.backgroundColor = [UIColor yellowColor];
    [_popBtn circleCorner];
    [_popBtn addTarget:self action:@selector(closeAndBack) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)popViewShow {
    UIImageView *imageV = [[UIImageView alloc]initWithFrame:_contentView.bounds];
    imageV.image = [UIImage imageNamed:@"red_packge.png"];
    [_contentView addSubview:imageV];
    [_contentView addSubview:_popBtn];
    
    [HWPopTool sharedInstance].shadeBackgroundType = ShadeBackgroundTypeSolid;
    [HWPopTool sharedInstance].closeButtonType = ButtonPositionTypeLeft;
    [[HWPopTool sharedInstance] showWithPresentView:_contentView animated:YES];
    
}

- (void)closeAndBack {
    [[HWPopTool sharedInstance] closeWithBlcok:^{
       // [self.navigationController popViewControllerAnimated:YES];
        [self.tabBarController setSelectedIndex:4];
    }];
}

@end
