#import <Foundation/Foundation.h>

#define ZLZ_ROW_HEIGHT                 ZLZkDefaultRowHeight
#define ZLZ_TOOLBAR_HEIGHT             ZLZkDefaultPortraitToolbarHeight
#define ZLZ_LANDSCAPE_TOOLBAR_HEIGHT   ZLZkDefaultLandscapeToolbarHeight

#define ZLZ_KEYBOARD_HEIGHT                 ZLZkDefaultPortraitKeyboardHeight
#define ZLZ_LANDSCAPE_KEYBOARD_HEIGHT       ZLZkDefaultLandscapeKeyboardHeight
#define ZLZ_IPAD_KEYBOARD_HEIGHT            ZLZkDefaultPadPortraitKeyboardHeight
#define ZLZ_IPAD_LANDSCAPE_KEYBOARD_HEIGHT  ZLZkDefaultPadLandscapeKeyboardHeight

#define  OFFSET 20  //新闻图集的偏移位置

//安全释放对象
#define RELEASE_SAFELY(__POINTER) { if(__POINTER){[__POINTER release]; __POINTER = nil; }}

/**
 * @返回当前iPhone OS 运行的版本
 */
float ZLZOSVersion();

/**
 * 
 */
BOOL ZLZOSVersionIsAtLeast(float version);

/**
 * @返回YES 键盘是可视化的
 */
BOOL ZLZIsKeyboardVisible();

/**
 * @返回YES，设备支持iPhone
 */
BOOL ZLZIsPhoneSupported();

/**
 * @返回YES，设备是iPad
 */
BOOL ZLZIsPad();

/**
 * @返回当前设备方向
 */
UIDeviceOrientation ZLZDeviceOrientation();

/**
 * 在iPhone/iPad touch上
 * 检查如果屏幕是portrait, landscape left, or landscape right.
 * 这个方法帮你忽略home按钮朝上的方向
 *
 * 在iPad上，一直返回YES
 */
BOOL ZLZIsSupportedOrientation(UIInterfaceOrientation orientation);

/**
 * @指定方法返回旋转的transform
 */
CGAffineTransform ZLZRotateTransformForOrientation(UIInterfaceOrientation orientation);

/**
 * @返回应用程序物理屏幕大小
 *
 */
CGRect ZLZApplicationBounds();
/**
 * @返回应用程序去掉状态栏高度的大小
 *
 */
CGRect ZLZApplicationFrame();

/**
 * @返回指定方向toolBar的高度
 *
 */
CGFloat ZLZToolbarHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @ 返回指定方向的键盘的高度
 */
CGFloat ZLZKeyboardHeightForOrientation(UIInterfaceOrientation orientation);

/**
 * @ 返回分组表格视图cell与屏幕之间的间距，iPad的间距会更大
 */
CGFloat ZLZGroupedTableCellInset();

///////////////////////////////////////////////////////////////////////////////////////////////////
// Dimensions of common iPhone OS Views

/**
 * 标准的tableview行高
 * @const 44 pixels
 */
extern const CGFloat ZLZkDefaultRowHeight;

/**
 * 标准的toolBar竖屏的高度The standard height of a toolbar in portrait orientation.
 * @const 44 pixels
 */
extern const CGFloat ZLZkDefaultPortraitToolbarHeight;

/**
 * 标准的toolBar横屏的高度 
 * @const 33 pixels
 */
extern const CGFloat ZLZkDefaultLandscapeToolbarHeight;

/**
 * 标准的键盘竖屏的高度
 * @const 216 pixels
 */
extern const CGFloat ZLZkDefaultPortraitKeyboardHeight;

/**
 * 标准的键盘横屏的高度
 * @const 160 pixels
 */
extern const CGFloat ZLZkDefaultLandscapeKeyboardHeight;

/**
 * 分组的表格视图cell边界与屏幕的间距
 * @const 10 pixels
 */
extern const CGFloat ZLZkGroupedTableCellInset;
