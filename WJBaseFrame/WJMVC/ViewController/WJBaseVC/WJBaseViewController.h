//
//  WJBaseViewController.h
//  WJBaseFrame
//
//  Created by jh navi on 16/2/2.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "globalHeaders.h"

@interface WJBaseViewController : UIViewController
{
    UIButton*                       _leftBtn;      //导航栏左按钮
    UIButton*                       _rightBtn;     //导航栏右按钮
    UIBarButtonItem*                _leftItem;     //导航栏左按钮条
    UIBarButtonItem*                _rightItem;    //导航栏右按钮条
    CGPoint startTouch;
}


#pragma mark - 导航栏

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden;       //导航栏是否隐藏
- (void)setNavigationBarColor:(UIColor *)navigationBarcolor;       //设置导航栏颜色

#pragma mark - 导航栏按钮

@property (nonatomic)   BOOL       leftItemHidden;    //导航栏左按钮条是否隐藏
@property (nonatomic)   BOOL       rightItemHidden;    //导航栏右按钮条是否隐藏
- (void)setRightItemImageName:(NSString*)imageName;    //导航栏右按钮条图片
- (void)setRightItemName:(NSString*)imageName;         //导航栏右按钮条名称

- (void)setLeftItemImageName:(NSString*)imageName;     //导航栏左按钮条图片
- (void)setLeftItemName:(NSString*)itemName;           //导航栏左按钮条名称


- (void)setLeftItemHidden:(BOOL)leftItemHidden;       //导航栏左按钮条是否隐藏
- (void)setRightItemHidden:(BOOL)rightItemHidden;     //导航栏右按钮条是否隐藏

- (void)leftBtnClicked;                               //点击导航栏左按钮
- (void)rightBtnClicked;                              //点击导航栏右按钮

#pragma mark - 提示的显示与隐藏

@property (strong, nonatomic) MBProgressHUD *hud;
@property (nonatomic, assign)  BOOL isLoading;

-(void)showText:(NSString*) str;                  //显示文字
-(void)showTextByStatus:(NSInteger) status;       //根据状态码显示文字
- (void) showLoadingStatus:(NSString*)str;        //显示加载状态
- (void) hideLoading;                             //隐藏hud

#pragma mark - 界面跳转

@property (strong, nonatomic) NSDictionary *segueDict;//跳转时的字典
@property (strong, nonatomic) NSMutableDictionary *identityDictionary;//跳转时转化用的字典

- (void)performSegue:(NSString *)identifier params:(NSDictionary*)skipParam;
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

#pragma mark - 隐藏所有子界面
-(void)hideOrShowAllSubviews:(BOOL) isHide;

@end
