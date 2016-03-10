//
//  WebVideoViewController.h
//  WJBaseFrame
//
//  Created by jh navi on 16/3/9.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJBaseViewController.h"
#import "ZFPlayerView.h"

@interface WebVideoViewController : WJBaseViewController
@property (nonatomic, strong) NSURL *videoURL;
@property (weak, nonatomic) IBOutlet ZFPlayerView *myPlayView;
@property (weak, nonatomic) IBOutlet UILabel *movieWebAddress;

@end
