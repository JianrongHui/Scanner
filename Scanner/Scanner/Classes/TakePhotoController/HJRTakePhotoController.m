//
//  HJRTakePhotoController.m
//  Scanner
//
//  Created by 辉建荣 on 15/12/16.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import "HJRTakePhotoController.h"
#import "IPDFCameraViewController.h"
#import "PDFManager.h"
#import "ReaderViewController.h"
#import "PDFImageConverter.h"

NSString *const kPDFFilePath = @"testPDF";
@interface HJRTakePhotoController ()<ReaderViewControllerDelegate>
{
    NSString *_imagePath;
}
@property (weak, nonatomic) IBOutlet IPDFCameraViewController *cameraViewController;


@end

@implementation HJRTakePhotoController

- (void)dealloc
{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.cameraViewController setupCameraView];
    self.cameraViewController.cameraViewType = IPDFCameraViewTypeNormal;
    [self.cameraViewController setEnableBorderDetection:YES];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.cameraViewController start];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma camera actions

- (IBAction)borderDetectButton:(id)sender {
    BOOL enable = !self.cameraViewController.isBorderDetectionEnabled;
    self.cameraViewController.enableBorderDetection = enable;
}

- (IBAction)filterButton:(id)sender {
    [self.cameraViewController setCameraViewType:(self.cameraViewController.cameraViewType == IPDFCameraViewTypeBlackAndWhite) ? IPDFCameraViewTypeNormal : IPDFCameraViewTypeBlackAndWhite];
}

- (IBAction)torchButton:(id)sender {
    self.cameraViewController.enableTorch  = !self.cameraViewController.isTorchEnabled;
}

- (IBAction)cameraButtonAction:(id)sender {

    __weak typeof(self) weakSelf = self;
    
    [self.cameraViewController captureImageWithCompletionHander:^(NSString *imageFilePath)
     {
         _imagePath = imageFilePath;
         UIImageView *captureImageView = [[UIImageView alloc] initWithImage:[UIImage imageWithContentsOfFile:imageFilePath]];
         captureImageView.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
         captureImageView.frame = CGRectOffset(weakSelf.view.bounds, 0, -weakSelf.view.bounds.size.height);
         captureImageView.alpha = 1.0;
         captureImageView.contentMode = UIViewContentModeScaleAspectFit;
         captureImageView.userInteractionEnabled = YES;
         [weakSelf.view addSubview:captureImageView];
         
         UITapGestureRecognizer *dismissTap = [[UITapGestureRecognizer alloc] initWithTarget:weakSelf action:@selector(dismissPreview:)];
         [captureImageView addGestureRecognizer:dismissTap];
         
         [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:0.7 options:UIViewAnimationOptionAllowUserInteraction animations:^
          {
              captureImageView.frame = weakSelf.view.bounds;
          } completion:nil];
     }];
}

- (void)buttonAction:(UIButton *)sender
{
    NSUserDefaults *user = [NSUserDefaults standardUserDefaults];
    [user setObject:_imagePath forKey:@"imagepath"];
    [user synchronize];
}

- (IBAction)cancelButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)pdfDestPath:(NSString *)filename
{
    return [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"Documents/%@.pdf",filename]];
}

- (void)dismissPreview:(UITapGestureRecognizer *)dismissTap
{
    [UIView animateWithDuration:0.7 delay:0.0 usingSpringWithDamping:0.8 initialSpringVelocity:1.0 options:UIViewAnimationOptionAllowUserInteraction animations:^
     {
         dismissTap.view.frame = CGRectOffset(self.view.bounds, 0, self.view.bounds.size.height);
     }
                     completion:^(BOOL finished)
     {
         [dismissTap.view removeFromSuperview];
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dismissReaderViewController:(ReaderViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - other
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
