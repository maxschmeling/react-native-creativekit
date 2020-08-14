#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SnapchatCreativeManager, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

RCT_EXTERN_METHOD(share:(NSString)path url:(NSString)attachmentUrl path:(NSString)videoPath withCaption:(NSString)caption resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end
