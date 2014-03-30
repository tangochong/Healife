//
//  UIFactory.m
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "UIFactory.h"

@implementation UIFactory

+ (ThemeButton *)createButton:(NSString *)imageName highlighted:(NSString *)highlightedName {
    ThemeButton *button = [[ThemeButton alloc] initWithImage:imageName highlighted:highlightedName];
    return button;
}

+ (ThemeButton *)createButtonWithBackground:(NSString *)backgroundImageName
                      backgroundHighlighted:(NSString *)highlightedName {
    ThemeButton *button = [[ThemeButton alloc] initWithBackground:backgroundImageName highlightedBackground:highlightedName];
    return button;
}
+ (ThemeImageView *)createImageView:(NSString *)imageName {
    ThemeImageView *themeImage = [[ThemeImageView alloc] initWithImageName:imageName];
    return themeImage;
}
+ (UIThemeLabel *)createLabel:(NSString *)colorName {
    UIThemeLabel *themeLabel = [[UIThemeLabel alloc] initWithColorName:colorName];
    return themeLabel;
}

+(UIButton *)createNavicationButton:(CGRect)frame
                              title:(NSString *)title
                             target:(id)target
                             action:(SEL)action
{
    ThemeButton *button = [self createButtonWithBackground:@"navigationbar_button_background.png" backgroundHighlighted:@"navigationbar_button_delete_background.png"];
    
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    button.leftCapWidth = 3;
    
    
    return button;
}


@end
