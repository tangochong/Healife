//
//  UIFactory.h
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThemeButton.h"
#import "ThemeImageView.h"
#import "UIThemeLabel.h"

@interface UIFactory : NSObject

//创建button
+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName;
+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName
                      backgroundHighlighted:(NSString *)highlightedName;
//创建导航栏上的按钮
+(UIButton *)createNavicationButton:(CGRect)frame
                              title:(NSString *)title
                             target:(id)target
                             action:(SEL)action;

//创建ImageView
+ (ThemeImageView *)createImageView:(NSString *)imageName;

//创建Label
+ (UIThemeLabel *)createLabel:(NSString *)colorName;

@end
