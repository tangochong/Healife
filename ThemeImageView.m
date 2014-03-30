//
//  ThemeImageView.m
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "ThemeImageView.h"
#import "ThemeManger.h"

@implementation ThemeImageView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(id) initWithImageName:(NSString *)iamgeName
{
    self = [self init];
    if (self != nil) {
        self.imageName = iamgeName;
    }
    return self;
}
-(id)init
{
    self = [super init];
    if (self) {
        //监听主题切换通知
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    
    [self loadThemeImage];
}

//加载当前主题下对应的图片
- (void)loadThemeImage {
    if (self.imageName == nil) {
        return;
    }
    
    UIImage *image = [[ThemeManger shareInstance] getThemeImage:_imageName];
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    self.image = image;
}

//主题切换的通知
#pragma mark - NSNotification actions
- (void)themeNotification:(NSNotification *)notification {
    [self loadThemeImage];
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
