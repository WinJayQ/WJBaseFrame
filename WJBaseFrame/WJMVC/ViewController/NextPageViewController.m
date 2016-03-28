//
//  NextPageViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/10.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "NextPageViewController.h"
#import "WJDropdownMenu.h"
#import "Masonry.h"
#import "UIView+Masonry.h"


// 防止block中的循环引用
#define WJ(weakSelf)  __weak __typeof(&*self)weakSelf = self;

@interface NextPageViewController ()<WJMenuDelegate>

@end

@implementation NextPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view showCustomDialog];
    [self addDropDownMenu];
    /*
    WJ(wj);
    UIView *sv = [[UIView alloc]init];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(wj.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.backgroundColor = [UIColor whiteColor];
    [sv addSubview:scrollView];
    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).insets(UIEdgeInsetsMake(5, 5, 5, 5));
    }];
    UIView *container = [UIView new];
    [scrollView addSubview:container];
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(scrollView);
        make.width.equalTo(scrollView);
    }];
    int count = 10;
    UIView *lastView = nil;
    for (int i= 1; i <= count; i++) {
        UIView *subv = [UIView new];
        [container addSubview:subv];
        subv.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 ) saturation:( arc4random() % 128 / 256.0 ) + 0.5 brightness:( arc4random() % 128 / 256.0 ) + 0.5 alpha:1.0];
        [subv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(container);
            make.height.mas_equalTo(@(20*i));
            if (lastView) {
                make.top.mas_equalTo(lastView.mas_bottom);
            }else{
                make.top.mas_equalTo(container.mas_top);
            }
        }];
        lastView = subv;
    }
    [container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastView.mas_bottom);
    }];*/
    
    [self testDistributeSpacing];
}

- (void)testDistributeSpacing {
    WJ(wj);
    UIView *sv = [[UIView alloc]init];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wj.view);
        make.top.equalTo(wj.view).offset(250);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    //给予不同的大小 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@[sv12,sv13]);
        make.centerX.equalTo(@[sv21,sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    [sv distributeSpacingHorizontallyWith:@[sv11,sv12,sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11,sv21,sv31]];
    
    
    	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    	dispatch_group_t group = dispatch_group_create();
    
    	dispatch_group_async(group, queue, ^{ /*任务a */
            NSLog(@"aaa");});
    	dispatch_group_async(group, queue, ^{ /*任务b */
        NSLog(@"bbb");});
    	dispatch_group_async(group, queue, ^{ /*任务c */
        NSLog(@"ccc");});
    	dispatch_group_async(group, queue, ^{ /*任务d */
        NSLog(@"ddd");});
    
    	dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        	    // 在a、b、c、d异步执行完成后，会回调这里
            NSLog(@"over");
        	});

}

- (void)addDropDownMenu {
    // 如果是有导航栏请清除自动适应设置
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSArray *fourMenuTitleArray =  @[@"菜单A",@"菜单B",@"菜单C",@"菜单D"];
    
    //  创建第一个菜单的first数据second数据
    NSArray *firstArrOne = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2",@"A一级菜单3", nil];
    
    NSArray *firstMenu = [NSArray arrayWithObject:firstArrOne];
    
    //  创建第二个菜单的first数据second数据
    NSArray *firstArrTwo = [NSArray arrayWithObjects:@"B一级菜单1",@"B一级菜单2", nil];
    NSArray *secondArrTwo = @[@[@"B二级菜单11",@"B二级菜单12"],@[@"B二级菜单21",@"B二级菜单22"]];
    NSArray *secondMenu = [NSArray arrayWithObjects:firstArrTwo,secondArrTwo, nil];
    
    //  创建第三个菜单的first数据second数据
    NSArray *firstArrThree = [NSArray arrayWithObjects:@"C一级菜单1",@"C一级菜单2", nil];
    NSArray *secondArrThree = @[@[@"C二级菜单11",@"C二级菜单12"],@[@"C二级菜单21",@"C二级菜单22"]];
    NSArray *threeMenu = [NSArray arrayWithObjects:firstArrThree,secondArrThree, nil];
    
    //  创建第四个菜单的first数据second数据
    NSArray *firstArrFour = [NSArray arrayWithObjects:@"D一级菜单1",@"D一级菜单2", nil];
    NSArray *secondArrFour = @[@[@"D二级菜单11",@"D二级菜单12"],@[@"D二级菜单21",@"D二级菜单22"]];
    NSArray *fourMenu = [NSArray arrayWithObjects:firstArrFour,secondArrFour, nil];
    
    WJDropdownMenu *menu = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 64, 0, 0)];//  size已固定可以随便填已固定
    menu.caverAnimationTime = 0.2;//  增加了遮盖层动画时间设置 不设置默认是 0.15
    menu.menuTitleFont = 12;      //  设置menuTitle字体大小 默认不设置是  11
    menu.tableTitleFont = 11;     //  设置tableTitle字体大小 默认不设置是 10
    menu.delegate = self;         //  设置代理
    
    [self.view addSubview:menu];
    
    // 一组菜单调用方法
    //[self createOneMenuTitleArray:oneMenuTitleArray FirstArray:firstMenu];
    
    // 二组菜单调用方法
    //[menu createTwoMenuTitleArray:twoMenuTitleArray FirstArr:firstMenu SecondArr:secondMenu];
    
    // 三组菜单调用方法
    //[menu createThreeMenuTitleArray:threeMenuTitleArray FirstArr:firstMenu SecondArr:secondMenu threeArr:threeMenu];
    
    // 四组菜单调用方法
    [menu createFourMenuTitleArray:fourMenuTitleArray FirstArr:firstMenu SecondArr:secondMenu threeArr:threeMenu fourArr:fourMenu];

}

- (void)menuCellDidSelected:(NSInteger)MenuTitleIndex firstIndex:(NSInteger)firstIndex andSecondIndex:(NSInteger)secondIndex{
    NSLog(@"菜单数:%ld          一级菜单数:%ld      二级子菜单数:%ld",MenuTitleIndex,firstIndex,secondIndex);
}

- (void)menuCellDidSelected:(NSString *)MenuTitle firstContent:(NSString *)firstContent andSecondContent:(NSString *)secondContent{
    NSLog(@"菜单title:%@       一级菜单:%@         二级子菜单:%@",MenuTitle,firstContent,secondContent);
}



@end
