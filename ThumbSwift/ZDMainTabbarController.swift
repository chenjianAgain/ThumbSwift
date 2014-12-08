//
//  ViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDMainTabbarController: UITabBarController, UITabBarControllerDelegate, ZDLoginTableViewControllerDelegate, ZDMyAccounViewControllerDelegate {

    var hasBeenLoggedIn: Bool?
    var userId: NSString?
    var password: NSString?
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.userId = NSUserDefaults.standardUserDefaults().objectForKey("DefaultCurrentUserId") as? NSString
        self.hasBeenLoggedIn = self.userId != nil
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if hasBeenLoggedIn! {
            self.password = NSUserDefaults.standardUserDefaults().objectForKey("DefaultCurrentPassword") as? NSString
            ZDWebService.sharedWebService().loginWithUserName(self.userId!, password: self.password!, completion:  { (error, resultDic) -> Void in
                println(resultDic)
                if (error == nil) {
                    var infos = resultDic["infos"] as NSDictionary
                    var dic = infos["customer"] as NSDictionary
                    ZDLoginStore.sharedInstance.currentCustomer = ZDCustomer(dic:dic)

                }
            })
        }
    }
    
    func setCustomTabBar() {
        for var i = 0; i < self.tabBar.items?.count; i++ {
            var tabBarItem = self.tabBar.items?[i] as UITabBarItem
            switch(i) {
                case 0:
                    tabBarItem.title = "投资理财"
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
    
    // MARK: - UITabBarControllerDelegate

    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        var userId = NSUserDefaults.standardUserDefaults().stringForKey("DefaultCurrentUserId")
        var nav2 = viewController as UINavigationController
        
        if userId == nil && nav2.topViewController is ZDMyAccounViewController {
            self.presentLoginViewController()
            return false
        }
        
        if nav2.topViewController is ZDMyAccounViewController {
            fetchMyAccountData()
        }
        
        return true
    }
    
    // MARK: - ZDLoginTableViewControllerDelegate
    
    func loginViewControllerDidLoggedIn(viewController: UIViewController, phoneNumber: NSString, password: NSString) {
        self.selectedIndex = 1
        fetchMyAccountData()
        NSUserDefaults.standardUserDefaults().setObject(phoneNumber, forKey: "DefaultCurrentUserId")
        NSUserDefaults.standardUserDefaults().setObject(password, forKey: "DefaultCurrentPassword")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.dismissViewControllerAnimated(true, completion: {} )
    }
    
    // MARK: - ZDMyAccounViewControllerDelegate
    
    func myAccounViewControllerShouldLogout(viewController: UIViewController) {
        self.selectedIndex = 0
        NSNotificationCenter.defaultCenter().postNotificationName("kMyAccountShouldClearNotification", object: self, userInfo: nil)
        NSUserDefaults.standardUserDefaults().setObject(nil, forKey: "DefaultCurrentUserId")
        NSUserDefaults.standardUserDefaults().synchronize()
        self.presentLoginViewController()
    }
    
    // MARK: - Private Method
    
    func presentLoginViewController() {
        var loginNav = UIStoryboard(name: "Login", bundle: nil).instantiateInitialViewController() as UINavigationController
        var loginVC = loginNav.topViewController as ZDLoginTableViewController
        loginVC.delegate = self
        self.presentViewController(loginNav, animated: true, completion: {})
    }
    
    func fetchMyAccountData() {
        var customerId = ZDLoginStore.sharedInstance.currentCustomer?.customerId
        if customerId != nil {
            ZDWebService.sharedWebService().updateCustomerTotalMoneyWithCustomerId(customerId, nil)
            
        }
    }

}

