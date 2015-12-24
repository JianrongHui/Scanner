//
//  HJRTakePhotoController.h
//  Scanner
//
//  Created by 辉建荣 on 15/12/16.
//  Copyright © 2015年 JianRongHui. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface HJRTakePhotoController : UIViewController

@property (nonatomic, copy) void (^takePhotoCompleteBlock) (NSString *);

@end
