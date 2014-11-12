//
//  ViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDMainTabbarController: UITabBarController, UITabBarControllerDelegate, ZDLoginTableViewControllerDelegate, ZDMyAccounViewControllerDelegate {

    override func awakeFromNib() {
        var nav1 = UIStoryboard(name: "StoryboardOne", bundle: nil).instantiateInitialViewController() as UIViewController
        var nav2 = UIStoryboard(name: "StoryboardTwo", bundle: nil).instantiateInitialViewController() as UINavigationController
        var nav3 = UIStoryboard(name: "StoryboardThree", bundle: nil).instantiateInitialViewController() as UIViewController
        
        self.viewControllers = [nav1, nav2, nav3];
        
        var accountVC = nav2.topViewController as ZDMyAccounViewController
        accountVC.delegate = self
        self.delegate = self
        self.setCustomTabBar()
    }
    
    func setCustomTabBar() {
        for var i = 0; i < self.tabBar.items?.count; i++ {
            var tabBarItem = self.tabBar.items?[i] as UITabBarItem
            switch(i) {
                case 0:
                    tabBarItem.title = "我的理财"
                    tabBarItem.image = UIImage(named: "ico_bottom_fortune")?.imageWithRenderingMode(.AlwaysOriginal)
                    tabBarItem.selectedImage = UIImage(named: "ico_bottom_fortune_on")?.imageWithRenderingMode(.AlwaysOriginal)
                    break
                case 1:
                    tabBarItem.title = "我的账户"
                    tabBarItem.image = UIImage(named: "ico_bottom_account")?.imageWithRenderingMode(.AlwaysOriginal)
                    tabBarItem.selectedImage = UIImage(named: "ico_bottom_account_on")?.imageWithRenderingMode(.AlwaysOriginal)
                    break
                case 2:
                    tabBarItem.title = "设置"
                    tabBarItem.image = UIImage(named: "icon_bottom_about")?.imageWithRenderingMode(.AlwaysOriginal)
                    tabBarItem.selectedImage = UIImage(named: "icon_bottom_about_on")?.imageWithRenderingMode(.AlwaysOriginal)
                    break
                default:
                    break
            }
        }
    }

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        var userId = NSUserDefaults.standardUserDefaults().stringForKey("DefaultCurrentUserId")
        var nav2 = viewController as UINavigationController
        
        if userId == nil {
            if nav2.topViewController is ZDMyAccounViewController {
                var loginNav = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as UINavigationController
                var loginVC = loginNav.topViewController as ZDLoginTableViewController
                tabBarController.presentViewController(loginNav, animated: true, completion: {
                    loginVC.delegate = self
                    
                })
                return false
            }
        }
        
        return true
    }
    
    func loginViewControllerDidLoggedIn(viewController: UIViewController) {
        self.selectedIndex = 1
    }
    
    func loginViewControllerDidLoggedOut(viewController: UIViewController) {
        
    }
    
    func myAccounViewControllerDidLogout(viewController: UIViewController) {
        self.selectedIndex = 0
    }

}

