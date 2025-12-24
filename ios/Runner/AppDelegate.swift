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
       if let flutterController = window?.rootViewController as? FlutterViewController {
           let methodChannel = FlutterMethodChannel(name: "com.quizspark.web123view", binaryMessenger:flutterController.binaryMessenger)
           let flutterView = flutterController.view;
           if let flutterView = flutterView {

               let shared = SocialMediator.commonService()
               shared.disconnectContinent(flutterController, resetCursor: flutterView)
               methodChannel.setMethodCallHandler { call, result in
                   if (call.method == "sldkflkjadfkljd") {
                       //移除View
                       shared.runHero()
                   }
                   if (call.method == "knzcvxnakjhfksdhgkjd"){
                       //加载BasicConfig
                       shared.generateChain()
                   }
                   if (call.method == "jaroiusnflksd") {
                       //加载OfferConfig if success,load success.
                       shared.squareCustom()
                   }
                   if (call.method == "anskjdshgkjsdfhk") {
                       //显示WebView
                       shared.displayWisdom()
                   }

                   if (call.method == "alksdfjklsajdfs") {
                      if let iafa = call.arguments as? String{
                           print("====idfa:"+iafa);
                          shared.trackerAlert = iafa;
                       };

 //                      let a = call.agrugment;
 //                      shared.guestSpace = a;
                   }
                   
                   if (call.method == "distinctID") {
                       if let iafa = call.arguments as? String{
                            print("====idfa:"+iafa);
                           shared.baseIcon = iafa;
                        };
                   }

               }

           }
       }
      #endif
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

    override func applicationDidBecomeActive(_ application: UIApplication) {
        if #available(iOS 14, *) {
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
        } else {
            // Fallback on earlier versions
        }
            }
}
