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
    func loginViewControllerDidLoggedIn(viewController: UIViewController)
}

class ZDLoginTableViewController: BaseViewController {
    
    @IBOutlet weak var registerButton: UIButton!
    
    var delegate: ZDLoginTableViewControllerDelegate?
    
    @IBAction func cancel() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func doSignInAction() {
        ZDWebService.sharedWebService().loginWithUserName("13818111655", password: "123456", { (error, resultDic) -> Void in
            println(resultDic)
            if (error == nil) {
                if self.delegate != nil {
                        self.delegate!.loginViewControllerDidLoggedIn(self)
                }
            }
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerButton.layer.borderColor = UIColor.lightGrayColor().CGColor!
        self.registerButton.layer.borderWidth = 0.5
    }
    
}
