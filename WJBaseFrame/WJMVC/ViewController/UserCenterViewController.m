//
//  UserCenterViewController.m
//  WJBaseFrame
//
//  Created by jh navi on 16/3/4.
//  Copyright © 2016年 WinJayQ. All rights reserved.
//

#import "UserCenterViewController.h"
#import "UIView+RoundCorner.h"
#import "UIImageView+RoundCorner.h"
#import "UIImage+RoundCorner.h"
#import "UIView+ImageSnapshot.h"
#import "AFNNetworkAdapter.h"
#import "UIAlertView+Blocks.h"
#import "PQActionSheet.h"
#import "NextPageViewController.h"

#define ORIGINAL_MAX_WIDTH 80
/* XCode-开发中消除警告语句
 #pragma clang diagnostic push
 #pragma clang diagnostic ignored "-Wdeprecated-declarations"
 <#这里包含住出现警告的代码#>
 #pragma clang diagnostic pop
 */
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

@interface UserCenterViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,PQActionSheetDelegate>

@end

int (^myBlock)(int,int);

@implementation UserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftItemHidden = YES;
     self.title = @"UserCenter";
    [self.myImageView sd_setImageWithURL:[NSURL URLWithString:@"http://img4.duitang.com/uploads/item/201506/07/20150607125257_T2RvC.png"]
                        placeholderImage:[UIImage imageNamed:@"10.png"]
                               completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                   NSLog(@"完成");
                                   //image=[self.view screenShot];截屏
                                   [self.myImageView setImage:[image imageWithCornerRadius:image.size.width/2]];//圆角
                               }];
    
    UITapGestureRecognizer *tapGesturRecognizer=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(changeHeadImage)];
    [self.myImageView addGestureRecognizer:tapGesturRecognizer];
    [self.myImageView circleCorner];
    self.myImageView.userInteractionEnabled = YES;
    [self.nextPageBtn setCorner:5];
    
    myBlock= ^(int a, int b){
        return a+b;
    };

    int result = myBlock(2,3);
    NSLog(@"%d",result);
    
   
}



#pragma mark - 更换头像
- (void)changeHeadImage {
    PQActionSheet *choiceSheet = [[PQActionSheet alloc]initWithTitle:@"一个高仿微信的ActionSheet!" clickedAtIndex:^(NSInteger index) {
        if (index==0) {
            if ([Tools isCameraPermissions]) {
                // 拍照
                if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
                    UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                    if ([self isRearCameraAvailable]) {//后置摄像头
                        controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                    }else{
                        controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                    }
                    
                    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                    [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                    controller.mediaTypes = mediaTypes;
                    controller.delegate = self;
                    [self presentViewController:controller
                                       animated:YES
                                     completion:^(void){
                                         NSLog(@"Picker View Controller is presented");
                                     }];
                }
            }else{
                UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请打开相机权限:设置 > 隐私 > 相机" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
                [alertView show];
            }
        }else if (index==1){
            // 从相册中选取
            if ([self isPhotoLibraryAvailable]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
        }else if (index==2){
             //保存图片
        }
    } cancelButtonTitle:@"取消" otherButtonTitles:@"拍照", @"从相册中选取",@"保存图片",nil];
    [choiceSheet show];
}

#pragma mark - 获取汽车品牌
- (void)loadCarBrandData{
    if (self.isLoading == YES) {
        return;
    }else{
        self.isLoading = YES;
        [self showLoadingStatus:@""];
    }
    
    //汽车品牌接口
    NSString *urlString = [kServerURL stringByAppendingString:@"/car/getcarbrand"];
    
    [AFNNetworkAdapter requestWithURL:urlString params:nil method:AFNRequestMethodGet success:^(AFHTTPRequestOperation *operation,id response) {
        NSLog(@"%ld",(long)operation.response.statusCode);
        NSLog(@"%@",response);
        self.isLoading = NO;
        [self hideLoading];
        
        NextPageViewController *nextVC = [self.storyboard instantiateViewControllerWithIdentifier:@"nextVC"];
        nextVC.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:nextVC animated:YES];
    } fail:^(AFHTTPRequestOperation *operation,NSError *error) {
        NSLog(@"%@",error);
        self.isLoading = NO;
        [self hideLoading];
    }];
}

- (IBAction)checkPhoneNum:(id)sender {
    [self checkTel:self.phoneTF.text];
}

- (IBAction)checkEmail:(id)sender {
    [self validateEmail:self.emailTF.text];
}

- (IBAction)checkPersonCode:(id)sender {
    [self checkIdentityCardNo:self.personCodeTF.text];
}

- (IBAction)gotoNextPage:(id)sender {
    [self loadCarBrandData];
}

//电话号码
- (BOOL)checkTel:(NSString *)mobileNumbel
{
    /**
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189,181(增加)
     */
    NSString * MOBIL = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|8[019])[0-9]|349)\\d{7}$";

    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBIL];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNumbel]
         || [regextestcm evaluateWithObject:mobileNumbel]
         || [regextestct evaluateWithObject:mobileNumbel]
         || [regextestcu evaluateWithObject:mobileNumbel])) {
        NSLog(@"手机号验证可用");
        [self showText:@"手机号验证可用"];
        return YES;
    }
   
   [UIAlertView showWithTitle:@"提示" message:@"请输入正确的手机号码" cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:nil];
    return NO;
}

-(BOOL)validateEmail:(NSString *)email
{
    
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if( [emailTest evaluateWithObject:email]){
        [self showText:@"邮箱验证合法"];
        return YES;
        
    }else{
        [UIAlertView showWithTitle:@"提示" message:@"请输入正确的邮箱" cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:nil];
        return NO;
    }
    return NO;
}

- (BOOL)checkIdentityCardNo:(NSString*)cardNo
{
    if (cardNo.length != 18) {
        [UIAlertView showWithTitle:@"提示" message:@"对不起!身份证的位数不够或过多" cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:^(UIAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 0) {
                NSLog(@"ok");
            }
        }];
        
        return  NO;
    }
    
    NSArray* codeArray = [NSArray arrayWithObjects:@"7",@"9",@"10",@"5",@"8",@"4",@"2",@"1",@"6",@"3",@"7",@"9",@"10",@"5",@"8",@"4",@"2", nil];
    
    NSDictionary* checkCodeDic = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"1",@"0",@"X",@"9",@"8",@"7",@"6",@"5",@"4",@"3",@"2", nil]  forKeys:[NSArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil]];
    
    NSScanner* scan = [NSScanner scannerWithString:[cardNo substringToIndex:17]];
    int val;
    
    BOOL isNum = [scan scanInt:&val] && [scan isAtEnd];
    
    if (!isNum) {
        [self showText:@"输入的身份证号码不对"];
        return NO;
    }
    
    int sumValue = 0;
    
    for (int i =0; i<17; i++) {
        sumValue+=[[cardNo substringWithRange:NSMakeRange(i , 1) ] intValue]* [[codeArray objectAtIndex:i] intValue];
    }
    
    NSString* strlast = [checkCodeDic objectForKey:[NSString stringWithFormat:@"%d",sumValue%11]];
    
    
    if ([strlast isEqualToString: [[cardNo substringWithRange:NSMakeRange(17, 1)]uppercaseString]]) {
        [self showText:@"验证身份证号码可用"];
        return YES;
        
    }
     [UIAlertView showWithTitle:@"提示" message:@"身份证号码错误" cancelButtonTitle:@"OK" otherButtonTitles:nil tapBlock:nil];
    return  NO;
    
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        self.myImageView.image = portraitImg;
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:^(){
    }];
}


#pragma mark - UIActionSheetDelegate
//调用拍照或者相册
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == 0) {
        if ([Tools isCameraPermissions]) {
            // 拍照
            if ([self isCameraAvailable] && [self doesCameraSupportTakingPhotos]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                if ([self isRearCameraAvailable]) {//后置摄像头
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceRear;
                }else{
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                }
                
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
        }else{
            UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"提示" message:@"请打开相机权限:设置 > 隐私 > 相机" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确认", nil];
            [alertView show];
        }
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([self isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
            }];
        }
    }
}

#pragma mark - camera utility
- (BOOL) isCameraAvailable{
    return [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) doesCameraSupportTakingPhotos {
    return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage sourceType:UIImagePickerControllerSourceTypeCamera];
}

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType{
    __block BOOL result = NO;
    if ([paramMediaType length] == 0) {
        return NO;
    }
    NSArray *availableMediaTypes = [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
    [availableMediaTypes enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop) {
        NSString *mediaType = (NSString *)obj;
        if ([mediaType isEqualToString:paramMediaType]){
            result = YES;
            *stop= YES;
        }
    }];
    return result;
}

- (BOOL) isRearCameraAvailable{
    return [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear];
}

- (BOOL) isPhotoLibraryAvailable{
    return [UIImagePickerController isSourceTypeAvailable:
            UIImagePickerControllerSourceTypePhotoLibrary];
}
#pragma clang diagnostic pop

@end
