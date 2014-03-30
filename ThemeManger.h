//
//  ThemeManger.h
//  Healife
//
//  Created by zoro on 14-3-24.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kThemeDidChangeNofication @"kThemeDidChangeNofication"

@interface ThemeManger : NSObject

//当前使用的主题名称
@property(nonatomic,retain) NSString *themeName;
//配置主题的plist文件
@property(nonatomic,retain) NSDictionary *themesPlist;
//label字体颜色配置plist文件
@property(nonatomic,retain) NSDictionary *fontColorPlist;

+(ThemeManger *)shareInstance;

//返回当前主题下的图片
-(UIImage *)getThemeImage:(NSString *)imageName;

//返回当前主题下，字体的颜色
-(UIColor *)getColorWithName:(NSString *)name;

@end
