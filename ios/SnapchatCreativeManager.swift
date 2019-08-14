import SCSDKCreativeKit

@objc(SnapchatCreativeManager)
class SnapchatCreativeManager: NSObject {
  @objc func share(_ resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
   DispatchQueue.main.async {
     let viewController: UIViewController = UIApplication.shared.windows[0].rootViewController!;
   }
  }
}

