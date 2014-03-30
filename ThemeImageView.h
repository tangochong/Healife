//
//  ThemeImageView.h
//  Healife
//
//  Created by zoro on 14-3-25.
//  Copyright (c) 2014年 zoro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ThemeImageView : UIImageView

//图片名称
@property(nonatomic,copy) NSString *imageName;

@property(nonatomic,assign)int leftCapWidth;
@property(nonatomic,assign)int topCapHeight;

-(id)initWithImageName:(NSString *) iamgeName;

@end
