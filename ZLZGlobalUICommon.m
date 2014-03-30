
#import "ZLZGlobalUICommon.h"

const CGFloat ZLZkDefaultRowHeight = 44;
              
const CGFloat ZLZkDefaultPortraitToolbarHeight   = 44;
const CGFloat ZLZkDefaultLandscapeToolbarHeight  = 33;

const CGFloat ZLZkDefaultPortraitKeyboardHeight      = 216;
const CGFloat ZLZkDefaultLandscapeKeyboardHeight     = 160;
const CGFloat ZLZkDefaultPadPortraitKeyboardHeight   = 264;
const CGFloat ZLZkDefaultPadLandscapeKeyboardHeight  = 352;

const CGFloat ZLZkGroupedTableCellInset = 9;
const CGFloat ZLZkGroupedPadTableCellInset = 42;

const CGFloat ZLZkDefaulZLZransitionDuration      = 0.3;
const CGFloat ZLZkDefaultFasZLZransitionDuration  = 0.2;
const CGFloat ZLZkDefaultFlipTransitionDuration  = 0.7;



///////////////////////////////////////////////////////////////////////////////////////////////////
float ZLZOSVersion()
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL ZLZOSVersionIsAtLeast(float version)
{
    static const CGFloat kEpsilon = 0.0000001;
#ifdef __IPHONE_6_0
    return 6.0 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_5_1
    return 5.1 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_5_0
    return 5.0 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_4_2
    return 4.2 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_4_1
    return 4.1 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_4_0
    return 4.0 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_3_2
    return 3.2 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_3_1
    return 3.1 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_3_0
    return 3.0 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_2_2
    return 2.2 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_2_1
    return 2.1 - version >= -kEpsilon;
#endif
#ifdef __IPHONE_2_0
    return 2.0 - version >= -kEpsilon;
#endif
    return NO;
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL ZLZIsKeyboardVisible() {
    // Operates on the assumption that the keyboard is visible if and only if there is a first
    // responder; i.e. a control responding to key events
    UIWindow* window = [UIApplication sharedApplication].keyWindow;
    return ![window isFirstResponder];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL ZLZIsPhoneSupported() {
    NSString* deviceType = [UIDevice currentDevice].model;
    return [deviceType isEqualToString:@"iPhone"];
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL ZLZIsPad() {
#ifdef __IPHONE_3_2
    return UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad;
#else
    return NO;
#endif
}


///////////////////////////////////////////////////////////////////////////////////////////////////
UIDeviceOrientation ZLZDeviceOrientation() {
    UIDeviceOrientation orient = [UIDevice currentDevice].orientation;
    if (UIDeviceOrientationUnknown == orient) {
        return UIDeviceOrientationPortrait;
        
    } else {
        return orient;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
BOOL ZLZIsSupportedOrientation(UIInterfaceOrientation orientation) {
    if (ZLZIsPad()) {
        return YES;
        
    } else {
        switch (orientation) {
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:
                return YES;
            default:
                return NO;
        }
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGAffineTransform ZLZRotateTransformForOrientation(UIInterfaceOrientation orientation) {
    if (orientation == UIInterfaceOrientationLandscapeLeft) {
        return CGAffineTransformMakeRotation(M_PI*1.5);
        
    } else if (orientation == UIInterfaceOrientationLandscapeRight) {
        return CGAffineTransformMakeRotation(M_PI/2);
        
    } else if (orientation == UIInterfaceOrientationPortraitUpsideDown) {
        return CGAffineTransformMakeRotation(-M_PI);
        
    } else {
        return CGAffineTransformIdentity;
    }
}

///////////////////////////////////////////////////////////////////////////////////////////////////

CGRect ZLZApplicationBounds()
{
    return [UIScreen mainScreen].bounds;
}

///////////////////////////////////////////////////////////////////////////////////////////////////
CGRect ZLZApplicationFrame() {
    CGRect frame = [UIScreen mainScreen].applicationFrame;
    return CGRectMake(0, 0, frame.size.width, frame.size.height);
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat ZLZToolbarHeightForOrientation(UIInterfaceOrientation orientation) {
    if (UIInterfaceOrientationIsPortrait(orientation) || ZLZIsPad()) {
        return ZLZ_ROW_HEIGHT;
        
    } else {
        return ZLZ_LANDSCAPE_TOOLBAR_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat ZLZKeyboardHeightForOrientation(UIInterfaceOrientation orientation) {
    if (ZLZIsPad()) {
        return UIInterfaceOrientationIsPortrait(orientation) ? ZLZ_IPAD_KEYBOARD_HEIGHT
        : ZLZ_IPAD_LANDSCAPE_KEYBOARD_HEIGHT;
        
    } else {
        return UIInterfaceOrientationIsPortrait(orientation) ? ZLZ_KEYBOARD_HEIGHT
        : ZLZ_LANDSCAPE_KEYBOARD_HEIGHT;
    }
}


///////////////////////////////////////////////////////////////////////////////////////////////////
CGFloat ZLZGroupedTableCellInset() {
    return ZLZIsPad() ? ZLZkGroupedPadTableCellInset : ZLZkGroupedTableCellInset;
}


