#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

#define BACK_PATH @"/var/mobile/Library/Preferences/dev.no5up.disablebackcamera"
#define FRONT_PATH @"/var/mobile/Library/Preferences/dev.no5up.disablefrontcamera"
/*
@interface AVCaptureSession(CameraControl)
@property (nonatomic, retain) NSMutableArray *hiddenFront;
@property (nonatomic, retain) NSMutableArray *hiddenBack;
@property (nonatomic) BOOL frontCameraEnabled;
@property (nonatomic) BOOL backCameraEnabled;
-(void)updateEnabledInputs;
@end

static NSMutableArray<AVCaptureSession*> *sessions = [[NSMutableArray alloc] initWithCapacity:250];
void updateAll(){
  if(sessions){
    for(AVCaptureSession *session in sessions){
      [session updateEnabledInputs];
    }
  }
}


%hook AVCaptureSession
%property (nonatomic, retain) NSMutableArray *hiddenFront;
%property (nonatomic, retain) NSMutableArray *hiddenBack;
%property (nonatomic) BOOL frontCameraEnabled;
%property (nonatomic) BOOL backCameraEnabled;

-(void)removeInput:(id)input {
  //[self.hiddenFront removeObject:input];
  //[self.hiddenBack removeObject:input];
  %orig;
}

-(void)addInput:(AVCaptureDeviceInput*)input {
  if (![sessions containsObject:self]) [sessions addObject:self];
  if(!self.hiddenFront){
    self.hiddenFront = [[NSMutableArray alloc] initWithCapacity:250];
    //self.frontCameraEnabled = [[NSFileManager defaultManager] fileExistsAtPath:PATH];
  }
  if(!self.hiddenBack){
    self.hiddenBack = [[NSMutableArray alloc] initWithCapacity:250];
    //self.backCameraEnabled = [[NSFileManager defaultManager] fileExistsAtPath:PATH];
  }
  if(input.device.position == AVCaptureDevicePositionBack && !self.backCameraEnabled){
    if (![self.hiddenBack containsObject:input]) [self.hiddenBack addObject: input];
    return;
  }
  if(input.device.position == AVCaptureDevicePositionFront && !self.frontCameraEnabled){
    if (![self.hiddenFront containsObject:input]) [self.hiddenFront addObject: input];
    return;
  }
  %orig;
}

-(BOOL)frontCameraEnabled{
  return [[NSFileManager defaultManager] fileExistsAtPath:FRONT_PATH];
}

-(BOOL)backCameraEnabled{
  return [[NSFileManager defaultManager] fileExistsAtPath:BACK_PATH];
}


%new
-(void)updateEnabledInputs{
  if(self.hiddenFront){
    if(self.frontCameraEnabled){
      for(AVCaptureDeviceInput* input in self.hiddenFront){
        @try{
          [self addInput: input];
        }@catch(id anException) {
            //Do nothing, obviously it wasn't attached because an exception was thrown.
        }
      }
    }else{
      for(AVCaptureDeviceInput* input in self.hiddenFront){
        [self removeInput: input];
      }
    }
  }
  if(self.hiddenBack){
    if(self.backCameraEnabled){
      for(AVCaptureDeviceInput* input in self.hiddenBack){
        @try{
          [self addInput: input];
        }@catch(id anException) {
            //Do nothing, obviously it wasn't attached because an exception was thrown.
        }
      }
    }else{
      for(AVCaptureDeviceInput* input in self.hiddenBack){
        [self removeInput: input];
      }
    }
  }
}

%end
*/
%hook AVCaptureFigVideoDevice
-(BOOL)isConnected{
  return [[NSFileManager defaultManager] fileExistsAtPath:BACK_PATH] ? NO : %orig;
}
%end
%ctor{
  //CFNotificationCenterAddObserver(CFNotificationCenterGetDarwinNotifyCenter(), NULL, (CFNotificationCallback)updateAll, CFSTR("dev.no5up.cameracontrol.update"), NULL, CFNotificationSuspensionBehaviorCoalesce);
}
