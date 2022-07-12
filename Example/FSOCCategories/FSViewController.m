//
//  FSViewController.m
//  FSOCCategories
//
//  Created by 张忠燕 on 07/11/2022.
//  Copyright (c) 2022 张忠燕. All rights reserved.
//

#import "FSViewController.h"
#import <FSOCCategories/UIButton+FSHitEdgeInsets.h>
#import <FSOCCategories/UIViewController+FSDocumentPickerViewController.h>
#import <FSOCCategories/UIViewController+FSDocumentInteractionController.h>
#import <FSOCCategories/UIViewController+FSQuickLookPreview.h>

@interface FSViewController ()

@end

@implementation FSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
//    [self performSelector:@selector(test) withObject:nil afterDelay:5];
//
//    self.documentPickerDidSelectedBlock = ^(NSString * _Nullable filePath, NSError * _Nullable error) {
//        NSLog(@"selected:%@", filePath);
//    };
//
//    self.documentPickerDidCancelBlock = ^{
//        NSLog(@"cancel");
//    };
}

- (void)test
{
//    [self presentViewController:self.documentPickerVC animated:YES completion:^{
//
//    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
