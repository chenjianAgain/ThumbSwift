//
//  AppDelegate.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        self.setNavigationBarAndTabbar()
        return true
    }

    func setNavigationBarAndTabbar() {
        //设置tabbaritem
        let tabBarItemTextAttributes = [NSForegroundColorAttributeName : (UIColor(red: 255 / 255.0, green: 116 / 255.0, blue: 106 / 255.0, alpha: 1))]
        UITabBarItem.appearance().setTitleTextAttributes(tabBarItemTextAttributes, forState: .Selected)
        
        //设置navigationbar
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bg_nav"), forBarMetrics: .Default)
        let navigationBarTextAttributes = [NSForegroundColorAttributeName : (UIColor(white: 1, alpha: 1)),
            NSFontAttributeName : UIFont.systemFontOfSize(20)]
        UINavigationBar.appearance().titleTextAttributes = navigationBarTextAttributes
        UINavigationBar.appearance().tintColor = UIColor(white: 1, alpha: 1)
        
        //设置statusbar
        UIApplication.sharedApplication().statusBarHidden = false
        UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
    }

}

