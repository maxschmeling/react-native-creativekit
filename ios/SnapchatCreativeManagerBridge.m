#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(SnapchatCreativeManager, NSObject)

+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

RCT_EXTERN_METHOD(share:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject)

@end

