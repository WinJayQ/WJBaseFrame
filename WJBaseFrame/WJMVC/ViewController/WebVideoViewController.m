//
//  WebVideoViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/9.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "WebVideoViewController.h"

@interface WebVideoViewController ()

@end

@implementation WebVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.myPlayView.videoURL = self.videoURL;
    self.myPlayView.goBackBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
    self.movieWebAddress.text = [self.videoURL absoluteString];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view.backgroundColor  = [UIColor whiteColor];
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

@end
