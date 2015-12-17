//
//  HJRTakePhotoController.m
//  Scanner
//
//  Created by 辉建荣 on 15/12/16.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRTakePhotoController.h"
#import "IPDFCameraViewController.h"

@interface HJRTakePhotoController ()

@property (weak, nonatomic) IBOutlet IPDFCameraViewController *cameraController;


@end

@implementation HJRTakePhotoController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.cameraController setupCameraView];
    [self.cameraController setEnableBorderDetection:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [self.cameraController start];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma camera actions

- (IBAction)borderDetectButton:(id)sender {
    BOOL enable = !self.cameraController.isBorderDetectionEnabled;
    self.cameraController.enableBorderDetection = enable;
}

- (IBAction)filterButton:(id)sender {
    [self.cameraController setCameraViewType:(self.cameraController.cameraViewType == IPDFCameraViewTypeBlackAndWhite) ? IPDFCameraViewTypeNormal : IPDFCameraViewTypeBlackAndWhite];
}

- (IBAction)torchButton:(id)sender {
    self.cameraController.enableTorch  = !self.cameraController.isTorchEnabled;
}

- (IBAction)cameraButtonAction:(id)sender {
    
    __weak typeof(self) weakSelf = self;
    [self.cameraController captureImageWithCompletionHander:^(NSString *imageFilePath) {
        if (weakSelf.takePhotoCompleteBlock) {
            weakSelf.takePhotoCompleteBlock(imageFilePath);
        }
        [weakSelf dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
