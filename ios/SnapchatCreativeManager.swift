import SCSDKCreativeKit

@objc(SnapchatCreativeManager)
class SnapchatCreativeManager: NSObject {
  var snapAPI: SCSDKSnapAPI?
  
  override init() {
    snapAPI = SCSDKSnapAPI();
  }
  
  @objc
  func share(_ path: String, url attachmentUrl: String, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
//    let stickerImage: UIImage = UIImage.init(contentsOfFile: path)!
    
    
//    let stickerImageUrl: URL = URL(string: )!;
    
    do {
//    let u: URL = URL.init(string: path)!;
//    let o: NSData.ReadingOptions = NSData.ReadingOptions.init();
//    let d: Data = try Data.init(contentsOf: u, options: o);
//    let image = UIImage.init(data: d);
    
//    let sticker = SCSDKSnapSticker(stickerImage: stickerImage);
      let stickerImageUrl: URL = URL(string: path)!; // "https://snapchat-sticker-temp-staging.s3.amazonaws.com/i31b7fe.png")!;
      
      let sticker = SCSDKSnapSticker(stickerUrl: stickerImageUrl, isAnimated: false);
      sticker.posX = 0.5;
      sticker.posY = 0.667;
      
      let snap = SCSDKNoSnapContent()
      snap.sticker = sticker
      snap.attachmentUrl = attachmentUrl
      
      DispatchQueue.main.async {
        self.snapAPI?.startSending(snap) { [weak self] (error: Error?) in
          if (error != nil) {
            reject("Error", "Unknown", error!)
          } else {
            resolve(nil);
          }
        }
      }
    } catch {
      
    }
  }
}
