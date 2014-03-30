//
//  ThemeButton.h
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeButton : UIButton

//Normal状态下的图片名称
@property(nonatomic,copy) NSString *imageName;
//高亮状态下的图片名称
@property(nonatomic,copy) NSString *highligtImageName;
//normal状态下的背景图片名称
@property(nonatomic,copy) NSString *backgroundImageName;
//高亮状态下的背景图片名称
@property(nonatomic,copy) NSString *backgroundHighligtImageName;

//设置图片拉伸的位置
@property(nonatomic,assign)int leftCapWidth;   //横向离原点的位置
@property(nonatomic,assign)int topCapHeight;   //纵向离原点的位置，y坐标

-(id) initWithImage:(NSString *)imageName highlighted:(NSString *)highligtImageName;
-(id) initWithBackground:(NSString *)backgroundImageName highlightedBackground:(NSString *)backgourndHighligtImageName;

@end
