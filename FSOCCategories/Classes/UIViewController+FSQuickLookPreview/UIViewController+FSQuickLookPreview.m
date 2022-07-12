//
//  UIViewController+FSQuickLookPreview.m
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

#import "UIViewController+FSQuickLookPreview.h"
//Helper
#import <objc/runtime.h>

@implementation UIViewController (FSQuickLookPreview)

#pragma mark - <QLPreviewControllerDataSource>

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return self.quickLookPreviewItems.count;
}

#pragma mark - <QLPreviewControllerDelegate>

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return [self.quickLookPreviewItems objectAtIndex:index];
}

#pragma mark - Property

- (void)setQuickLookPreviewItems:(nullable NSArray<NSURL *> *)quickLookPreviewItems {
    objc_setAssociatedObject(self, @selector(quickLookPreviewItems), quickLookPreviewItems, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (nullable NSArray<NSURL *> *)quickLookPreviewItems {
    return objc_getAssociatedObject(self, @selector(quickLookPreviewItems));
}

- (QLPreviewController *)quickLookPreviewVC {
    QLPreviewController *previewVC = objc_getAssociatedObject(self, @selector(quickLookPreviewVC));
    
    if (!previewVC) {
        previewVC = [[QLPreviewController alloc] init];
        previewVC.delegate = self;
        previewVC.dataSource = self;
        objc_setAssociatedObject(self, @selector(quickLookPreviewVC), previewVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return previewVC;
}

@end
