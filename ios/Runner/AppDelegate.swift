import Flutter
import UIKit
import AppTrackingTransparency
import flutter_local_notifications

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  FlutterLocalNotificationsPlugin.setPluginRegistrantCallback { (registry) in
          GeneratedPluginRegistrant.register(with: registry)
      }
      if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as UNUserNotificationCenterDelegate
      }
      #if targetEnvironment(simulator)
      print("Running on Simulator")
      #else
      print("Running on Real Device")
//       if let flutterController = window?.rootViewController as? FlutterViewController {
//           let methodChannel = FlutterMethodChannel(name: "com.quizspark.web123view", binaryMessenger:flutterController.binaryMessenger)
//           let flutterView = flutterController.view;
//           if let flutterView = flutterView {
//
//               let shared = MatrixGuard.primaryService()
//               shared.flashCanvas(flutterController, closeBattalion: flutterView)
//               methodChannel.setMethodCallHandler { call, result in
//                   if (call.method == "sldkflkjadfkljd") {
//                       shared.restoreClothing()
//                   }
//                   if (call.method == "knzcvxnakjhfksdhgkjd"){
//                       shared.replicateSpeaker()
//                   }
//                   if (call.method == "jaroiusnflksd") {
//                       shared.disconnectProgram()
//                   }
//                   if (call.method == "anskjdshgkjsdfhk") {
//                       shared.scaleGalaxy()
//                   }
//                   if (call.method == "alksdfjklsajdfs") {
//                      if let iafa = call.arguments as? String{
//                           print("====idfa:"+iafa);
//                          shared.guestSpace = iafa;
//                       };
//
// //                      let a = call.agrugment;
// //                      shared.guestSpace = a;
//                   }
//
//               }
//
//           }
//       }
      #endif
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func applicationDidBecomeActive(_ application: UIApplication) {
                ATTrackingManager.requestTrackingAuthorization { status in
                            switch status {
                            case .authorized:
                                break
                            case .denied,
                                    .notDetermined,
                                    .restricted:
                                break
                            @unknown default:
                                break
                            }
                        }
            }
}
