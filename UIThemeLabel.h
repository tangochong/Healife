//
//  UIThemeLabel.h
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIThemeLabel : UILabel

@property(nonatomic,copy) NSString *colorName;

-(id) initWithColorName:(NSString *)colorName;

@end
