import SCSDKCreativeKit

@objc(SnapchatCreativeManager)
class SnapchatCreativeManager: NSObject {
  var snapAPI: SCSDKSnapAPI?
  
  override init() {
    snapAPI = SCSDKSnapAPI();
  }
  
  @objc
  func share(_ path: String?, url attachmentUrl: String, path videoPath: String?, resolver resolve: @escaping RCTPromiseResolveBlock, rejecter reject: @escaping RCTPromiseRejectBlock) -> Void {
    
    var sticker: SCSDKSnapSticker? = nil;
    
    if (path != nil) {
      let stickerImageUrl: URL = URL(string: path!)!; // "https://snapchat-sticker-temp-staging.s3.amazonaws.com/i31b7fe.png")!;
      
      sticker = SCSDKSnapSticker(stickerUrl: stickerImageUrl, isAnimated: false);
      sticker!.posX = 0.5;
      sticker!.posY = 0.667;
    }
          
    let snap: SCSDKSnapContent;
    
    if (videoPath != nil) {
      let videoUrl = URL(string: videoPath!)!;
      let video = SCSDKSnapVideo(videoUrl: videoUrl);
      
      snap = SCSDKVideoSnapContent(snapVideo: video);
    } else {
      snap = SCSDKNoSnapContent();
    }
    
    snap.sticker = sticker
    snap.attachmentUrl = attachmentUrl
    
    DispatchQueue.main.async {
      self.snapAPI?.startSending(snap) { (error: Error?) in
        if (error != nil) { reject("Error", "Unknown", error!) }
        else { resolve(nil); }
      }
    }
  }
}
