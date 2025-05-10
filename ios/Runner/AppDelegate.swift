import UIKit
import Flutter
import YandexMapsMobile

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    YMKMapKit.setLocale("ru_RU") 
    YMKMapKit.setApiKey("41c886da-48d7-45c1-b95e-9e85e881e555")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}