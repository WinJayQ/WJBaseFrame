//
//  UserCenterViewController.h
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WJBaseViewController.h"
#import "UIImageView+WebCache.h"

@interface UserCenterViewController : WJBaseViewController
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITextField *phoneTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *personCodeTF;
@property (weak, nonatomic) IBOutlet UIButton *nextPageBtn;


- (IBAction)checkPhoneNum:(id)sender;
- (IBAction)checkEmail:(id)sender;
- (IBAction)checkPersonCode:(id)sender;
- (IBAction)gotoNextPage:(id)sender;


@end
