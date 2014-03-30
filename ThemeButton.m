//
//  ThemeButton.m
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import "ThemeButton.h"
#import "ThemeManger.h"

@implementation ThemeButton

-(id)initWithImage:(NSString *)imageName highlighted:(NSString *)highligtImageName
{
    self = [self init];
    if (self) {
        self.imageName = imageName;
        self.highligtImageName = highligtImageName;
    }
    return self;
}

-(id) initWithBackground:(NSString *)backgroundImageName highlightedBackground:(NSString *)backgourndHighligtImageName
{
    self = [self init];
    if (self) {
        self.backgroundImageName = backgroundImageName;
        self.backgroundHighligtImageName = backgourndHighligtImageName;
    }
    return self;
}
-(id) init
{
    self = [super init];
    if (self)
    {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(themeNotification:) name:kThemeDidChangeNofication object:nil];
    }
    return self;
}
-(void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    //  [super dealloc];
}

-(void) setLeftCapWidth:(int)leftCapWidth
{
    _leftCapWidth = leftCapWidth;
    [self loadThemeImage];
}

-(void) setTopCapHeight:(int)topCapHeight
{
    _topCapHeight = topCapHeight;
    [self loadThemeImage];
}
#pragma mark - NSNotification action
//切换主题的通知
-(void) themeNotification:(NSNotification *) notification
{
    [self loadThemeImage];
}
//加载图片
-(void) loadThemeImage
{
    ThemeManger *themeManger = [ThemeManger shareInstance];
    
    UIImage *image = [themeManger getThemeImage:_imageName];
    
    UIImage *highligtImage = [themeManger getThemeImage:_highligtImageName];
    image = [image stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    highligtImage = [highligtImage stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    
    [self setImage:image forState:UIControlStateNormal];
    [self setImage:highligtImage forState:UIControlStateHighlighted];
    
    UIImage *backImage = [themeManger getThemeImage:_backgroundImageName];
    UIImage *backHighligtImage = [themeManger getThemeImage:_backgroundHighligtImageName];
    
    backImage = [backImage stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    backHighligtImage = [backHighligtImage stretchableImageWithLeftCapWidth:self.leftCapWidth topCapHeight:self.topCapHeight];
    [self setBackgroundImage:backImage forState:UIControlStateNormal];
    [self setBackgroundImage:backHighligtImage forState:UIControlStateHighlighted];
    
}
#pragma mark - setter  设置图片名后，重新加载该图片名对应的图片
- (void)setImageName:(NSString *)imageName {
    if (_imageName != imageName) {
        _imageName = [imageName copy];
    }
    //重新加载图片
    [self loadThemeImage];
}

- (void)setHighligtImageName:(NSString *)highligtImageName {
    if (_highligtImageName != highligtImageName) {
        _highligtImageName = [highligtImageName copy];
    }
    
    //重新加载图片
    [self loadThemeImage];
}

- (void)setBackgroundImageName:(NSString *)backgroundImageName {
    if (_backgroundImageName != backgroundImageName) {
        _backgroundImageName = [backgroundImageName copy];
    }
    
    //重新加载图片
    [self loadThemeImage];
}

- (void)setBackgroundHighligtImageName:(NSString *)backgroundHighligtImageName {
    if (_backgroundHighligtImageName != backgroundHighligtImageName) {
        _backgroundHighligtImageName = [backgroundHighligtImageName copy];
    }
    
    //重新加载图片
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
