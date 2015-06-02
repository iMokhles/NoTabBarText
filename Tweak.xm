#import <UIKit/UIKit.h>
#import <substrate.h>

@interface UITabBarButton : UIControl 
@end

%hook UITabBarButton
-(void)layoutSubviews {
	UIView *infoMS = MSHookIvar<UIView *>(self, "_info");
	UILabel *labelMS = MSHookIvar<UILabel *>(self, "_label");

	labelMS.text = nil;
	labelMS.textColor = [UIColor clearColor];
	
	infoMS.center = CGPointMake(self.frame.size.width  / 2, 
                                 self.frame.size.height / 2);
}
%end

