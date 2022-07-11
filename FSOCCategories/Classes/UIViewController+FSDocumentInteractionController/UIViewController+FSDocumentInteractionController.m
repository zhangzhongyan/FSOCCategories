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

- (void)showDocumentInteractionControllerWithURL:(NSURL *)url
{
    if (url.absoluteString.length) {
        self.document = [UIDocumentInteractionController interactionControllerWithURL:url];
        self.document.delegate = self;
        [self.document presentOpenInMenuFromRect:self.view.bounds inView:self.view animated:YES];
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

- (void)setDocument:(UIDocumentInteractionController *)document {
    objc_setAssociatedObject(self, @selector(document), document, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIDocumentInteractionController *)document {
    UIDocumentInteractionController *document = objc_getAssociatedObject(self, @selector(document));
    return document;
}

@end
