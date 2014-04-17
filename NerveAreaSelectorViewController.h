//
//  NerveAreaSelectorViewController.h
//
//	省市区三级选择器，可以自己输入
//	
//  Created by 集成显卡 on 13-5-17.
//  Copyright (c) 2013年 集成显卡 zxingming@qq.com . All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    PROVINCE,
    CITY,
    AREA
} NerveSelectoreType;

//
//选择器协议，在调用的ViewController中实现此协议即可
//
@protocol NerveAreaSelectDelegate <NSObject>

@optional
- (void)onAreaSelect:(NSString *)selectValue;
- (void)onAreaCannel;
-(void) changeLabelText:(NSString *)text;
@end

@interface NerveAreaSelectorViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    
    NSArray *provinces, *cities, *areas;
    NSString *province, *city, *area;
    
    NSInteger selectType;//当前的选择类型，省，市，区
    
    
}

@property (nonatomic,assign) id<NerveAreaSelectDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *areaTX;
@property (weak, nonatomic) IBOutlet UITableView *areaTableView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *okBtn;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cannelBtn;


//
//初始化数据
//
-(id) initWithDelegate:(id<NerveAreaSelectDelegate>) targetDelegate;

//
//确定按钮点击事件
//
- (IBAction)onOkBtnClick:(id)sender;

//
//取消按钮点击事件
//
- (IBAction)okCannelBtnClick:(id)sender;

//
//隐藏键盘用的
//
- (IBAction)exitInput:(id)sender;

@end
