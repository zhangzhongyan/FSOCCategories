//
//  UIViewController+FSDocumentPickerViewController.m
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

#import "UIViewController+FSDocumentPickerViewController.h"
//Helper
#import <objc/runtime.h>

@implementation UIViewController (FSFileDocumentPicker)

#pragma mark - Private Methods

+ (NSString *)fs_SecurityScopedDirectionPath
{
    return [NSTemporaryDirectory() stringByAppendingPathComponent:@"FSSecurityScoped"];
}

+ (void)fs_CreateSecurityScopedDirectionPath
{
    BOOL isDir = NO;
    NSString *dataFilePath = [UIViewController fs_SecurityScopedDirectionPath];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    // fileExistsAtPath 判断一个文件或目录是否有效，isDirectory判断是否一个目录
    BOOL existed = [fileManager fileExistsAtPath:dataFilePath isDirectory:&isDir];
    if ( !(isDir == YES && existed == YES) ) {
        // 在 Document 目录下创建一个 head 目录
        [fileManager createDirectoryAtPath:dataFilePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

- (void)fs_handleDocumentWithURL:(NSURL *)url {
    BOOL canAccessingResource = [url startAccessingSecurityScopedResource];
    if (canAccessingResource) {
        NSFileCoordinator *fileCoordinator = [[NSFileCoordinator alloc] init];
        NSError *error;
        [fileCoordinator coordinateReadingItemAtURL:url options:0 error:&error byAccessor:^(NSURL *newURL) {
            NSString *fileName = newURL.path.lastPathComponent;
            [UIViewController fs_CreateSecurityScopedDirectionPath];
            NSString *path = [[UIViewController fs_SecurityScopedDirectionPath] stringByAppendingPathComponent:fileName];
            NSData *data = [NSData dataWithContentsOfURL:newURL];
            [data writeToFile:path atomically:YES];
            
            if (self.documentPickerDidSelectedBlock) {
                self.documentPickerDidSelectedBlock(path, nil);
            }
        }];
        if (error) {
            NSLog(@"文件出错 %@", error);
            if (self.documentPickerDidSelectedBlock) {
                self.documentPickerDidSelectedBlock(nil, error);
            }
        }
        [url stopAccessingSecurityScopedResource];
    } else {
        
        if (self.documentPickerDidSelectedBlock) {
            NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey:@"The file startAccessingSecurityScopedResource failed."};
            NSError *error = [[NSError alloc] initWithDomain:@"com.francis.component.categories" code:NSURLErrorCannotDecodeContentData userInfo:userInfo];
            self.documentPickerDidSelectedBlock(nil, error);
        }
    }
}

#pragma mark - <UIDocumentPickerDelegate>

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_11_0
            
- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentsAtURLs:(NSArray <NSURL *>*)urls {
    if (urls.count) {
        for (NSURL *url in urls) {
            [self fs_handleDocumentWithURL:url];
        }
    } else {
        if (self.documentPickerDidSelectedBlock) {
            NSDictionary *userInfo = @{NSLocalizedFailureReasonErrorKey:@"PickerController doesn't selected any file."};
            NSError *error = [[NSError alloc] initWithDomain:@"com.francis.component.categories" code:NSURLErrorCannotDecodeContentData userInfo:userInfo];
            self.documentPickerDidSelectedBlock(nil, error);
        }
    }
}

#else

- (void)documentPicker:(UIDocumentPickerViewController *)controller didPickDocumentAtURL:(NSURL *)url {
    [self fs_handleDocumentWithURL:url];
}

#endif

- (void)documentPickerWasCancelled:(UIDocumentPickerViewController *)controller {
    if (self.documentPickerDidCancelBlock) {
        self.documentPickerDidCancelBlock();
    }
}

#pragma mark - Property

- (void)setDocumentPickerDidSelectedBlock:(nullable FSDocumentPickerDidSelectedBlock)documentPickerDidSelectedBlock {
    objc_setAssociatedObject(self, @selector(documentPickerDidSelectedBlock), documentPickerDidSelectedBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (nullable FSDocumentPickerDidSelectedBlock)documentPickerDidSelectedBlock {
    return objc_getAssociatedObject(self, @selector(documentPickerDidSelectedBlock));
}

- (void)setDocumentPickerDidCancelBlock:(FSDocumentPickerDidCancelBlock)documentPickerDidCancelBlock {
    objc_setAssociatedObject(self, @selector(documentPickerDidCancelBlock), documentPickerDidCancelBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (nullable FSDocumentPickerDidCancelBlock)documentPickerDidCancelBlock {
    return objc_getAssociatedObject(self, @selector(documentPickerDidCancelBlock));
}

- (UIDocumentPickerViewController *)documentPickerVC {
    UIDocumentPickerViewController *documentPickerVC = objc_getAssociatedObject(self, @selector(documentPickerVC));
    
    if (!documentPickerVC) {
        NSArray<NSString *> *documentTypes = @[@"public.data"];
        
        documentPickerVC = [[UIDocumentPickerViewController alloc] initWithDocumentTypes:documentTypes inMode:UIDocumentPickerModeOpen];
        documentPickerVC.delegate = self;
        
        objc_setAssociatedObject(self, @selector(documentPickerVC), documentPickerVC, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return documentPickerVC;
}

@end
