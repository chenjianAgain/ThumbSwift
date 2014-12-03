//
//  ZDLoginTableViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/12.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDLoginTableViewControllerDelegate {
    func loginViewControllerDidLoggedIn(viewController: UIViewController, phoneNumber: NSString, password: NSString)
}

class ZDLoginTableViewController: BaseViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var delegate: ZDLoginTableViewControllerDelegate?
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doSignInAction() {
        ZDWebService.sharedWebService().loginWithUserName(self.usernameTextField.text, password: self.passwordTextField.text, { (error, resultDic) -> Void in
            println(resultDic)
            if (error == nil) {
                var infos = resultDic["infos"] as NSDictionary
                var dic = infos["customer"] as NSDictionary
                ZDLoginStore.sharedInstance.currentCustomer = ZDCustomer(dic:dic)
                if self.delegate != nil {
                    self.delegate!.loginViewControllerDidLoggedIn(self, phoneNumber: self.usernameTextField.text, password: self.passwordTextField.text)
                }
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerButton.layer.borderColor = UIColor.lightGrayColor().CGColor!
        self.registerButton.layer.borderWidth = 0.5
        self.usernameTextField.text = "13052116682"
        self.passwordTextField.text = "123456"
    }
    
}