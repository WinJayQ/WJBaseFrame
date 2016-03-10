//
//  FourthViewController.h
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJBaseViewController.h"

@interface MovieViewController : WJBaseViewController
@property (weak, nonatomic) IBOutlet UIButton *playLocalBtn;
@property (weak, nonatomic) IBOutlet UIButton *playWebBtn;
- (IBAction)playLocalVideo:(id)sender;
- (IBAction)playWebVideo:(id)sender;

@end
