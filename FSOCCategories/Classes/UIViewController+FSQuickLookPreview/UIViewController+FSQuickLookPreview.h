//
//  UIViewController+FSQuickLookPreview.h
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

#import <UIKit/UIKit.h>
//Helper
#import <QuickLook/QuickLook.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FSQuickLookPreview) <QLPreviewControllerDataSource, QLPreviewControllerDelegate>

@property (nonatomic, strong, nullable) NSArray<NSURL *> *quickLookPreviewItems;

@property (nonatomic, strong, readonly) QLPreviewController *quickLookPreviewVC;

@end

NS_ASSUME_NONNULL_END
