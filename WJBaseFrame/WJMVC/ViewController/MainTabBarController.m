//
//  MainTabBarController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "MainTabBarController.h"
#import "ChartViewController.h"
#import "GamesViewController.h"
#import "ThirdViewController.h"
#import "MovieViewController.h"
#import "UserCenterViewController.h"
#import "UINavigationBar+Utilities.h"
#import "EAIntroPage.h"
#import "EAIntroView.h"


@interface MainTabBarController ()<EAIntroDelegate>
{
    UINavigationController *chartNaviController;
    UINavigationController *gamesNaviController;
    UINavigationController *thirdNaviController;
    UINavigationController *movieNaviController;
    UINavigationController *userCenterNaviController;
}
@property (nonatomic, strong)EAIntroView *intro;

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tabBar setTranslucent:NO];
    self.delegate = self;
    
    [self initSetViewControllers];
    
    [self setViewControllers:@[chartNaviController,gamesNaviController,thirdNaviController,movieNaviController,userCenterNaviController]];
    
    [self addGuidancePicture];
}

- (void)initSetViewControllers
{
    NSBundle *bundle = [NSBundle mainBundle];
    
    UIStoryboard *chartStoryboard = [UIStoryboard storyboardWithName:@"Chart" bundle:bundle];
    chartNaviController = [chartStoryboard instantiateInitialViewController];
    chartNaviController.tabBarItem.title = @"Chart";
    UIImage *normalImage = [UIImage imageNamed:@"my_nor.png"];
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    chartNaviController.tabBarItem.image = normalImage;
    UIImage *selectedImage = [UIImage imageNamed:@"my_sel.png"];
    selectedImage = [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    chartNaviController.tabBarItem.selectedImage = selectedImage;
    
    UIStoryboard *gamesStoryboard = [UIStoryboard storyboardWithName:@"Games" bundle:bundle];
    gamesNaviController = [gamesStoryboard instantiateInitialViewController];
    gamesNaviController.tabBarItem.title = @"Game";
    UIImage *normalImage2 = [UIImage imageNamed:@"my_nor.png"];
    normalImage2 = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    gamesNaviController.tabBarItem.image = normalImage2;
    UIImage *selectedImage2 = [UIImage imageNamed:@"my_sel.png"];
    selectedImage2 = [selectedImage2 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    gamesNaviController.tabBarItem.selectedImage = selectedImage2;
    
    UIStoryboard *thirdStoryboard = [UIStoryboard storyboardWithName:@"Third" bundle:bundle];
    thirdNaviController = [thirdStoryboard instantiateInitialViewController];
    thirdNaviController.tabBarItem.title = @"Third";
    UIImage *normalImage3 = [UIImage imageNamed:@"my_nor.png"];
    normalImage3 = [normalImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdNaviController.tabBarItem.image = normalImage3;
    UIImage *selectedImage3 = [UIImage imageNamed:@"my_sel.png"];
    selectedImage3 = [selectedImage3 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    thirdNaviController.tabBarItem.selectedImage = selectedImage3;
    
    UIStoryboard *fourthStoryboard = [UIStoryboard storyboardWithName:@"movie" bundle:bundle];
    movieNaviController = [fourthStoryboard instantiateInitialViewController];
    movieNaviController.tabBarItem.title = @"movie";
    UIImage *normalImage4 = [UIImage imageNamed:@"my_nor.png"];
    normalImage4 = [normalImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    movieNaviController.tabBarItem.image = normalImage4;
    UIImage *selectedImage4 = [UIImage imageNamed:@"my_sel.png"];
    selectedImage4 = [selectedImage4 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    movieNaviController.tabBarItem.selectedImage = selectedImage4;
    
    UIStoryboard *userCenterStoryboard = [UIStoryboard storyboardWithName:@"UserCenter" bundle:bundle];
    userCenterNaviController = [userCenterStoryboard instantiateInitialViewController];
    userCenterNaviController.tabBarItem.title = @"UserCenter";
    UIImage *normalImage5 = [UIImage imageNamed:@"my_nor.png"];
    normalImage5 = [normalImage5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userCenterNaviController.tabBarItem.image = normalImage5;
    UIImage *selectedImage5 = [UIImage imageNamed:@"my_sel.png"];
    selectedImage5 = [selectedImage5 imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    userCenterNaviController.tabBarItem.selectedImage = selectedImage5;
    
    //设置所有navibar的默认样式
    [[UINavigationBar appearance] setBarTintColor:RGBA(38, 128, 152, 1)];
    
    //设置third导航栏
    [thirdNaviController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav128"] forBarMetrics:UIBarMetricsDefault];
    
    
    //设置fourth导航栏
    [movieNaviController.navigationBar setBackgroundImage:[UIImage imageNamed:@"nav128"] forBarMetrics:UIBarMetricsDefault];
    [movieNaviController.navigationBar setBarStyle:UIBarStyleBlackOpaque];
    
    
    //设置其他导航栏
    [userCenterNaviController.navigationBar drawNaviBar];
    
}

- (void)addGuidancePicture {
    self.navigationController.navigationBarHidden = YES;
    EAIntroPage *page1 = [EAIntroPage page];
    EAIntroPage *page2 = [EAIntroPage page];
    EAIntroPage *page3 = [EAIntroPage page];
    EAIntroPage *page4 = [EAIntroPage page];
    
    if (self.view.bounds.size.height == 480) {
        page1.bgImage = [UIImage imageNamed:@"introduce_1_4.png"];
        
        page2.bgImage = [UIImage imageNamed:@"introduce_2_4.png"];
        
        page3.bgImage = [UIImage imageNamed:@"introduce_3_4.png"];
        
        page4.bgImage = [UIImage imageNamed:@"introduce_4_4.png"];
    }else if(self.view.bounds.size.height == 568){
        page1.bgImage = [UIImage imageNamed:@"introduce_1_5.png"];
        
        page2.bgImage = [UIImage imageNamed:@"introduce_2_5.png"];
        
        page3.bgImage = [UIImage imageNamed:@"introduce_3_5.png"];
        
        page4.bgImage = [UIImage imageNamed:@"introduce_4_5.png"];
    }else if (self.view.bounds.size.height == 667){
        page1.bgImage = [UIImage imageNamed:@"introduce_1_6.png"];
        
        page2.bgImage = [UIImage imageNamed:@"introduce_2_6.png"];
        
        page3.bgImage = [UIImage imageNamed:@"introduce_3_6.png"];
        
        page4.bgImage = [UIImage imageNamed:@"introduce_4_6.png"];
    }else if (self.view.bounds.size.height >= 736){
        page1.bgImage = [UIImage imageNamed:@"introduce_1_6+.png"];
        
        page2.bgImage = [UIImage imageNamed:@"introduce_2_6+.png"];
        
        page3.bgImage = [UIImage imageNamed:@"introduce_3_6+.png"];
        
        page4.bgImage = [UIImage imageNamed:@"introduce_4_6+.png"];
    }
    
    self.intro = [[EAIntroView alloc] initWithFrame:self.view.bounds andPages:@[page1,page2,page3,page4]];
    [self.intro setDelegate:self];
    [self.intro showInView:self.view animateDuration:0.4];
}

- (void)introDidFinish {
    self.navigationController.navigationBarHidden = NO;
}


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    //NSLog(@"%@",item);
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController NS_AVAILABLE_IOS(3_0)
{
   // NSLog(@"9999");
    return YES;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    if (viewController == self.viewControllers[0]) {
       NSLog(@"00000");
    }else if (viewController == self.viewControllers[1]) {
        NSLog(@"11111");
    }else if (viewController == self.viewControllers[2]) {
        NSLog(@"22222");
    }else if (viewController == self.viewControllers[3]) {
        NSLog(@"33333");
    }else if (viewController == self.viewControllers[4]) {
        NSLog(@"44444");
    }
}

@end
