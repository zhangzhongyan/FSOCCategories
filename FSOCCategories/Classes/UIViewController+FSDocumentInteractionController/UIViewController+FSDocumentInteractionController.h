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

/// 文件交互控制器
@property (nonatomic, strong, nullable) UIDocumentInteractionController *documentInteraction;

/// 显示系统文件弹框
/// @param url 文件必须是已经下载好的
- (void)presentDocumentInteractionControllerWithURL:(NSURL *)url;

/// 获取系统文件弹框
/// @param url 文件必须是已经下载好的
- (nullable UIDocumentInteractionController *)setupDocumentInteractionControllerWithURL:(nullable NSURL *)url;

@end

NS_ASSUME_NONNULL_END
