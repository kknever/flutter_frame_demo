import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      GeneratedPluginRegistrant.register(with: self)

      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController


      let basicMessageChannel = FlutterBasicMessageChannel(name: "testBasicMessageChannel", binaryMessenger: controller.binaryMessenger)


      let methodChannel = FlutterMethodChannel(name: "testNativeChannel", binaryMessenger: controller.binaryMessenger)
      methodChannel.setMethodCallHandler { (call:FlutterMethodCall, result:@escaping FlutterResult) in
        if (call.method == "testNative") {
            print("call ios native")
            result("from ios native")
            basicMessageChannel.sendMessage("send from iOS!!!!")
//              if let dict = call.arguments as? Dictionary<String, Any> {
//                  let name:String = dict["name"] as? String ?? ""
//                  let age:Int = dict["age"] as? Int ?? -1
//                  result(["name":"hello,\(name)","age":age])
//              }
        }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
