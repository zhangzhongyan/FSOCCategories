//
//  UIViewController+FSDocumentPickerViewController.h
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

/** 系统文件弹框(选择文件) */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^FSDocumentPickerDidSelectedBlock)(NSString * _Nullable filePath, NSError * _Nullable error);
typedef void(^FSDocumentPickerDidCancelBlock)(void);
@interface UIViewController (FGFileDocumentPicker) <UIDocumentPickerDelegate>

/// 系统文件选择控制器
@property (nonatomic, strong, readonly) UIDocumentPickerViewController *documentPickerVC;

/** 选择文件回调 */
@property (nonatomic, strong, nullable) FSDocumentPickerDidSelectedBlock documentPickerDidSelectedBlock;

/// 取消回调
@property (nonatomic, strong, nullable) FSDocumentPickerDidCancelBlock documentPickerDidCancelBlock;

@end

NS_ASSUME_NONNULL_END
