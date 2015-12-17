//
//  ViewController.m
//  Scanner
//
//  Created by 辉建荣 on 15/12/15.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "ViewController.h"
#import "HJRTakePhotoController.h"

typedef NS_ENUM(NSInteger,EtakePhotoType) {
    eTakeFrontImage = 0,
    eTakeBackImage
};

@interface ViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImagePickerController *picker;
@property (weak, nonatomic) IBOutlet UIButton *frontImageButton;
@property (weak, nonatomic) IBOutlet UIButton *backImageButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _picker = [[UIImagePickerController alloc] init];
}

#pragma mark - 点击事件

- (IBAction)firstButtonAction:(UIButton *)sender {
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:nil
                                          message:nil
                                          preferredStyle:UIAlertControllerStyleActionSheet
                                          ];
    UIAlertAction *cancleAction = [UIAlertAction
                                   actionWithTitle:@"取消"
                                   style:UIAlertActionStyleCancel
                                   handler:^(UIAlertAction * _Nonnull action) {
                                       
                                   }];
    UIAlertAction *takePhotoAction = [UIAlertAction
                                      actionWithTitle:@"拍照"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * _Nonnull action) {
                                          UIButton *btn = (UIButton *)sender;
                                          if (btn.tag == 100) {
                                              [self takePhotoType:eTakeFrontImage];
                                          } else {
                                             [self takePhotoType:eTakeBackImage];
                                          }
                                      }];
    UIAlertAction *albumAction = [UIAlertAction
                                      actionWithTitle:@"相册"
                                      style:UIAlertActionStyleDefault
                                      handler:^(UIAlertAction * _Nonnull action) {
                                          [self getPickerFromAlbum];
                                      }];
    [alertController addAction:cancleAction];
    [alertController addAction:takePhotoAction];
    [alertController addAction:albumAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

- (void)takePhotoType:(EtakePhotoType)type
{
    if ([self isAvailableAlbum]) {
//        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
//        UIView *overlayView = [UIView new];
//        overlayView.backgroundColor = [UIColor redColor];
//        overlayView.frame = CGRectMake(0, 100, 320, 200);
////        _picker.cameraOverlayView = overlayView;
//        [self presentViewController:_picker animated:YES completion:nil];
        HJRTakePhotoController *vc = [[HJRTakePhotoController alloc] init];
        __weak typeof(self) weakSelf = self;
        [vc setTakePhotoCompleteBlock:^(NSString *imageFilePath) {
            if (type == eTakeFrontImage) {
                [weakSelf.frontImageButton setBackgroundImage:[UIImage imageWithContentsOfFile:imageFilePath] forState:UIControlStateNormal];
            } else {
                [weakSelf.backImageButton setBackgroundImage:[UIImage imageWithContentsOfFile:imageFilePath] forState:UIControlStateNormal];
            }
        }];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
}

- (void)getPickerFromAlbum
{
    if ([self isAvailableAlbum]) {
        _picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_picker animated:YES completion:nil];
    }
}

#pragma mark - pravite
- (BOOL)isAvailableTakePhoto
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        return YES;
    }
    return NO;
}

- (BOOL)isAvailableAlbum
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        return YES;
    }
    return NO;
}

@end
