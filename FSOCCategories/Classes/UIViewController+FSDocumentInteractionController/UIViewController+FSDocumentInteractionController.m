//
//  UIViewController+FSDocumentInteractionController.m
//  Fargo
//
//  Created by 张忠燕 on 2020/4/13.
//  Copyright © 2020 geekthings. All rights reserved.
//

#import "UIViewController+FSDocumentInteractionController.h"
//Helper
#import <objc/runtime.h>

@implementation UIViewController (FSDocumentInteractionController)

#pragma mark - Public Methods

- (void)presentDocumentInteractionControllerWithURL:(NSURL *)url
{
    [self setupDocumentInteractionControllerWithURL:url];
    [self.documentInteraction presentOpenInMenuFromRect:self.view.bounds inView:self.view animated:YES];
}

- (nullable UIDocumentInteractionController *)setupDocumentInteractionControllerWithURL:(nullable NSURL *)url
{
    if (url) {
        self.documentInteraction = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.documentInteraction.delegate = self;
        return self.documentInteraction;
    } else {
        return nil;
    }
}

#pragma mark - <UIDocumentInteractionControllerDelegate>

- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller {
    return self;
}

- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller {
    return self.view;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller {
    return self.view.frame;
}

#pragma mark - Property

- (void)setDocumentInteraction:(UIDocumentInteractionController *)documentInteraction {
    objc_setAssociatedObject(self, @selector(documentInteraction), documentInteraction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIDocumentInteractionController *)documentInteraction {
    UIDocumentInteractionController *document = objc_getAssociatedObject(self, @selector(documentInteraction));
    return document;
}

@end
