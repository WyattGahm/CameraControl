#import "FrontCameraCCButton.h"

#define PATH @"/var/jb/var/mobile/Library/Preferences/dev.no5up.disablefrontcamera"

@implementation FrontCameraCCButton
-(BOOL)isSelected {
	return [[NSFileManager defaultManager] fileExistsAtPath:PATH];
}

-(void)setSelected:(BOOL)selected {
	[super refreshState];
	NSFileManager *fm = [NSFileManager defaultManager];
	selected ? [fm createFileAtPath:PATH contents:nil attributes:nil] : [fm removeItemAtPath:PATH error:nil];
	CFNotificationCenterPostNotification(CFNotificationCenterGetDarwinNotifyCenter(), (CFStringRef)@"dev.no5up.cameracontrol.update", nil, nil, true);
}
@end
