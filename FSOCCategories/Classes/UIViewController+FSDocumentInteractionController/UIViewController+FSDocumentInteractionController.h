//
//  UIViewController+FSDocumentInteractionController.h
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 文件交互 控制器(其他应用打开 + 存储)
@interface UIViewController (FSDocumentInteractionController) <UIDocumentInteractionControllerDelegate>

/// 系统文件
@property (nonatomic, strong, nullable) UIDocumentInteractionController *document;

/// 显示系统文件弹框
- (void)showDocumentInteractionControllerWithURL:(NSURL *)url;

@end

NS_ASSUME_NONNULL_END
