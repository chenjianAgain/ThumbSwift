//
//  IncomeViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/25.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDIncomeViewController: UIViewController {

    @IBOutlet weak var accountTotalLabel: UILabel!
    @IBOutlet weak var incomeTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "execute:", name: "kMyAccountShouldRefreshNotification", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "clear", name: "kMyAccountShouldClearNotification", object: nil)
        // Do any additional setup after loading the view.
    }
    
    func execute(notification: NSNotification) {
        var userInfo = notification.userInfo! as NSDictionary
        let account = NSString.formatStringToSaveWithString(userInfo["accountTotal"] as? String, digit:2, decimalStyle: false)
        let income = NSString.formatStringToSaveWithString(userInfo["incomeTotal"] as? String, digit: 2, decimalStyle: false)
        self.accountTotalLabel.text = account
        self.incomeTotalLabel.text = income

    }
    
    func clear() {
        self.accountTotalLabel.text = "0.00"
        self.incomeTotalLabel.text = "0.00"
    }
    
}
