//
//  LocalVideoViewController.h
//  WJBaseFrame
//
//  Created by jh navi on 16/3/9.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJBaseViewController.h"
#import "ZFPlayerView.h"

@interface LocalVideoViewController : WJBaseViewController
@property (weak, nonatomic) IBOutlet ZFPlayerView *playerView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end
