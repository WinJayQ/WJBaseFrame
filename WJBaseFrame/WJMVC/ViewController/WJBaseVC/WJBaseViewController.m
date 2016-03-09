//
//  WJBaseViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/2/2.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "WJBaseViewController.h"
#import "WJBaseTableViewController.h"

@interface WJBaseViewController ()

@end

@implementation WJBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.navigationBar setBarTintColor:RGBA(38, 128, 152, 1)];
    self.identityDictionary = [[NSMutableDictionary alloc] init];
    [self setupNavButton];
}

#pragma mark - Gesture Recognizer -

- (void)paningGestureReceive:(UIPanGestureRecognizer *)recoginzer
{
    
    if(self.navigationController.viewControllers.count <= 1)return;
    CGPoint touchPoint = [recoginzer locationInView:[[UIApplication sharedApplication]keyWindow]];
    
    if (recoginzer.state == UIGestureRecognizerStateBegan) {//开始滑动
        startTouch = touchPoint;
    }else if (recoginzer.state == UIGestureRecognizerStateEnded){
        
        if (touchPoint.x - startTouch.x > 50)//向右滑动
        {
            [self leftBtnClicked];
        }
        else//向左滑动
        {
        }
        return;
        
    }else if (recoginzer.state == UIGestureRecognizerStateCancelled){
        
        return;
    }
    
}
- (void)setupNavButton
{
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_leftBtn setImage:[UIImage imageNamed:@"common_top_back_nor.png"]
              forState:UIControlStateNormal];
    //    [_leftBtn setBackgroundImage:[UIImage imageNamed:@"common_top_back_press.png"]
    //                         forState:UIControlStateHighlighted];
    [_leftBtn sizeToFit];
    [_leftBtn addTarget:self
                 action:@selector(leftBtnClicked)
       forControlEvents:UIControlEventTouchUpInside];
    
    _leftItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = _leftItem;
    
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"common_top_btn_nor"]
                         forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:[UIImage imageNamed:@"common_top_btn_press"]
                         forState:UIControlStateHighlighted];
    [_rightBtn sizeToFit];
    [_rightBtn addTarget:self
                  action:@selector(rightBtnClicked)
        forControlEvents:UIControlEventTouchUpInside];
    _rightItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    
}

- (void)setNavigationBarHidden:(BOOL)navigationBarHidden {
    self.navigationController.navigationBar.hidden = navigationBarHidden;
}

- (void)setNavigationBarColor:(UIColor *)navigationBarcolor {
    [self.navigationController.navigationBar setBarTintColor:navigationBarcolor];
}

- (void)setLeftItemImageName:(NSString*)imageName
{
    [self setLeftItemHidden:NO];
    
    [_leftBtn setImage:[UIImage imageNamed:imageName]
              forState:UIControlStateNormal];
    [_leftBtn setImage:[UIImage imageNamed:imageName]
              forState:UIControlStateHighlighted];
    [_leftBtn sizeToFit];
}

- (void)setRightItemImageName:(NSString*)imageName
{
    [self setRightItemHidden:NO];
    [_rightBtn setBackgroundImage:nil
                         forState:UIControlStateNormal];
    [_rightBtn setBackgroundImage:nil
                         forState:UIControlStateHighlighted];
    [_rightBtn setTintColor:[UIColor clearColor]];
    [_rightBtn setBackgroundColor:[UIColor clearColor]];
    [_rightBtn setImage:[UIImage imageNamed:imageName]
               forState:UIControlStateNormal];
    [_rightBtn setImage:[UIImage imageNamed:imageName]
               forState:UIControlStateHighlighted];
    
    [_rightBtn sizeToFit];
}


-(void)setLeftItemName:(NSString *)itemName
{
    NSString* name;
    if (itemName.length > 2) {
        name =itemName;
    }
    else{
        name = [NSString stringWithFormat:@" %@ ",itemName];
    }
    
    
    if (!_leftBtn)
    {
        _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    
    [_leftBtn setTitle:name forState:UIControlStateNormal];
    [_leftBtn viewCornerWithBoarderWith:1 color:[UIColor clearColor]];
    [_leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:@selector(leftBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _leftItem = [[UIBarButtonItem alloc]initWithCustomView:_leftBtn];
    [_leftBtn sizeToFit];
    self.navigationItem.leftBarButtonItem = _leftItem;
}

-(void)setRightItemName:(NSString *)itemName
{
    NSString* name;
    if (itemName.length > 2) {
        name =itemName;
    }
    else{
        name = [NSString stringWithFormat:@" %@ ",itemName];
    }
    
    if (!_rightBtn)
    {
        _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    }
    
    [_rightBtn viewCornerWithBoarderWith:1 color:[UIColor clearColor]];
    [_rightBtn setTitle:name forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:@selector(rightBtnClicked) forControlEvents:UIControlEventTouchUpInside];
    _rightItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
    [_rightBtn sizeToFit];
    self.navigationItem.rightBarButtonItem = _rightItem;
}

- (void)setNavBarHidden:(BOOL)hidden animated:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:hidden animated:animated];
}


- (void)setRightItemHidden:(BOOL)rightItemHidden
{
    if (rightItemHidden)
        self.navigationItem.rightBarButtonItem = nil;
    else
        self.navigationItem.rightBarButtonItem = _rightItem;
}

- (void)setLeftItemHidden:(BOOL)leftItemHidden
{
    if (leftItemHidden)
        self.navigationItem.leftBarButtonItem = nil;
    else
        self.navigationItem.leftBarButtonItem = _leftItem;
}


- (BOOL)rightItemHidden
{
    return self.navigationItem.rightBarButtonItem != nil;
}


- (void)leftBtnClicked
{
    [self.view endEditing:YES];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnClicked
{
    //自定义
}

#pragma mark - 提示的显示与隐藏

-(void)showText:(NSString*) str
{
    MBProgressHUD* hud = [[MBProgressHUD alloc]init];
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.labelText = str;
    hud.mode = MBProgressHUDModeCustomView;
    hud.minShowTime = 1;
    hud.alpha = 0.5;
    [hud hide:YES afterDelay:1];
    //    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
}

-(void)showTextByStatus:(NSInteger) status
{
    NSString *str = [Tools getErrorTextByStatus:status];
    
    UIView *view = [[UIApplication sharedApplication].delegate window];
    
    _hud = [[MBProgressHUD alloc] initWithView:view];
    
    _hud.labelText = str;
    _hud.mode = MBProgressHUDModeCustomView;
    _hud.removeFromSuperViewOnHide = YES;
    _hud.minShowTime = 1;
    _hud.alpha = 0.5;
    [view addSubview:_hud];
    [_hud hide:YES afterDelay:1];
    
    //[self showText:str];
}

- (void)showLoadingStatus:(NSString *)str
{
    [self showLoadingInWindows:NO text:str];
}

- (void) showLoadingInWindows:(BOOL)inWindows text:(NSString*)str
{
    UIView *view = [[UIApplication sharedApplication].delegate window];
    if (!inWindows) {
        view = self.view;
    }
    [self.hud hide:NO];
    
    _hud = [[MBProgressHUD alloc] initWithView:view];
    
    _hud.labelText = str;
    _hud.mode = MBProgressHUDModeIndeterminate;
    _hud.removeFromSuperViewOnHide = YES;
    [view addSubview:_hud];
    [_hud show:YES];
}

- (void) hideLoading
{
    //    [MBProgressHUD hideAllHUDsForView:self.view animated:YES];
    if (_hud) {
        [_hud hide:YES];
        _hud.hidden = YES;
        _hud = nil;
    }
}

#pragma mark - 界面跳转
- (void)performSegue:(NSString *)identifier params:(NSDictionary*)skipParam
{
    if (_identityDictionary) {
        [_identityDictionary removeAllObjects];
    }
    
    if (skipParam == nil) {
        NSLog(@"ext ======= nil");
    }else
    {
        if (!_identityDictionary) {
            _identityDictionary = [NSMutableDictionary dictionary];
        }
        
        [_identityDictionary setObject:skipParam forKey:identifier];
    }
    [super performSegueWithIdentifier:identifier sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([_identityDictionary objectForKey:segue.identifier]) {
        if ([segue.destinationViewController isKindOfClass:[WJBaseViewController class]]) {
            WJBaseViewController *controller = (WJBaseViewController *)segue.destinationViewController;
            controller.segueDict = [_identityDictionary objectForKey:segue.identifier];
            
        }
        else if([segue.destinationViewController isKindOfClass:[WJBaseTableViewController class]])
        {
            WJBaseTableViewController *controller = (WJBaseTableViewController *)segue.destinationViewController;
            controller.segueDict = [_identityDictionary objectForKey:segue.identifier];
        }
        else if([segue.destinationViewController isKindOfClass:[UINavigationController class]])
        {
            UINavigationController *nav = (UINavigationController*)segue.destinationViewController;
            WJBaseViewController *base = (WJBaseViewController*)nav.topViewController;
            base.segueDict = [_identityDictionary objectForKey:segue.identifier];
        }
    }
}

#pragma mark - 隐藏或者显示所有子界面
-(void)hideOrShowAllSubviews:(BOOL) isHide
{
    for (UIView* view in self.view.subviews) {
        view.hidden = isHide;
    }
}


@end
