//
//  NSString+FSSize.m
//  EVCRMApp
//
//  Created by 张忠燕 on 2021/11/2.
//

#import "NSString+FSSize.h"

@implementation NSString (FSSize)

#pragma mark - Public Methods

- (CGSize)getUICeilSize:(UIFont *)font {
    CGSize size = [self getUISize:font];
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

- (CGSize)getUICeilSize:(UIFont *)font limitWidth:(CGFloat)width {
    CGSize size = [self getUISize:font limitWidth:width];
    return CGSizeMake(ceil(size.width), ceil(size.height));
}

- (CGSize)getUISize:(UIFont *)font {
    return [self getUISize:font limitWidth:CGFLOAT_MAX];
}

- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width {
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil];
    
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil].size;
}

- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineSpacing:(CGFloat)space {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    return [self getUISize:font limitWidth:width paragraphStyle:paragraphStyle];
}

- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineSpacing:(CGFloat)space paragraphSpacingBefore:(CGFloat)paragraphSpacingBefore {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = space;
    paragraphStyle.paragraphSpacingBefore = paragraphSpacingBefore;
    return [self getUISize:font limitWidth:width paragraphStyle:paragraphStyle];
}

- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width lineBreakMode:(NSLineBreakMode)lineBreakMode {
    
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    
    NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName, nil];
    
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil].size;
}

#pragma mark - Private Methods

- (CGSize)getUISize:(UIFont *)font limitWidth:(CGFloat)width paragraphStyle:(NSParagraphStyle *)paragraphStyle {
    CGSize size = CGSizeMake(width, CGFLOAT_MAX);
    NSDictionary *attributesDict = [NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName,paragraphStyle, NSParagraphStyleAttributeName, nil];
    
    return [self boundingRectWithSize:size options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributesDict context:nil].size;
}

@end
