#import "BackCameraCCButton.h"

#define PATH @"/var/mobile/Library/Preferences/dev.no5up.disablebackcamera"

@implementation BackCameraCCButton
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
