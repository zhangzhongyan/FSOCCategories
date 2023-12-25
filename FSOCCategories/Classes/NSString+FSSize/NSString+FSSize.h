//
//  NSString+FSSize.h
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/11/2.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FSSize)

/** 获取字符串的Size */
- (CGSize)getUISize:(UIFont *)font;

/** 获取字符串的Size */
- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width;

/** 获取字符串的Size */
- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineSpacing:(CGFloat)space;

/** 获取字符串的Size */
- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineSpacing:(CGFloat)space paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore;

/** 获取字符串的Size */
- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode;

/** 获取字符串的Size取整 */
- (CGSize)getUICeilSize:(UIFont *)font;

/** 获取字符串的Size取整 */
- (CGSize)getUICeilSize:(UIFont *)font limitWidth:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
