//
//  UIThemeLabel.m
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "UIThemeLabel.h"
#import "ThemeManger.h"

@implementation UIThemeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(id) init
{
    self = [super init];
    if (self != nil) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}

-(id) initWithColorName:(NSString *)colorName
{
    self = [self init];
    if (self != nil) {
        self.colorName = colorName;
    }
    return self;
}

-(void) setColorName:(NSString *)colorName
{
    if (_colorName != colorName) {
        _colorName = [colorName copy];
    }
    [self setColor];
}

-(void) setColor
{
    UIColor *textColor = [[ThemeManger shareInstance] getColorWithName:_colorName];
    self.textColor = textColor;
}

-(void) themeNotification:(NSNotification *) notification
{
    [self setColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
