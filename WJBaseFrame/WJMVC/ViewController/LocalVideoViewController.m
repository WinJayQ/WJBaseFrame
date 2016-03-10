//
//  LocalVideoViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/9.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "LocalVideoViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import "Masonry.h"

@interface LocalVideoViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation LocalVideoViewController

-(void)dealloc
{
    NSLog(@"%@释放了",self.class);
    [self.playerView cancelAutoFadeOutControlBar];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"视频播放";
    
    
    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"mov"];
    self.playerView.videoURL = videoURL;
    self.playerView.goBackBlock = ^{
        [self.navigationController popViewControllerAnimated:YES];
    };
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    if (toInterfaceOrientation == UIInterfaceOrientationPortrait) {
        self.view.backgroundColor  = [UIColor whiteColor];
    }else if (toInterfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.view.backgroundColor = [UIColor blackColor];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"localCell"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.myTableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
