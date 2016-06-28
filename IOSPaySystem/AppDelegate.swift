//
//  AppDelegate.swift
//  IOSPaySystem
//
//  Created by IOS Developer on 14/06/2016.
//  Copyright © 2016 Slash Global. All rights reserved.


import UIKit





@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    //  BTAppSwitch.setReturnURLScheme("com.SlashGlobal.IOSPaySystem.payments")
       
        return true
        
    }
    
    
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//        
//        if url.scheme.localizedCaseInsensitiveCompare("com.SlashGlobal.IOSPaySystem.payments") == .OrderedSame {
//            return BTAppSwitch.handleOpenURL(url, sourceApplication:sourceApplication)
//        }
//        
//        return false
//    }

    func applicationWillResignActive(application: UIApplication) {
        
        
        
        
    }

    func applicationDidEnterBackground(application: UIApplication) {
        
        
        
    }

    func applicationWillEnterForeground(application: UIApplication) {
      
    }

    func applicationDidBecomeActive(application: UIApplication) {
        
    }

    func applicationWillTerminate(application: UIApplication) {
        
    }


}

