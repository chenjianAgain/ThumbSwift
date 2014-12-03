//
//  ZDOfflineApplyViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOfflineApplyViewController: UIViewController, ShowOfflineHeadViewControllerDelegate, UITextFieldDelegate {

    var product: ZDProduct?
    var mobile: NSString?
    
    @IBOutlet weak var objectCustomerLabel: UILabel!
    @IBOutlet weak var featureLabel: UILabel!
    @IBOutlet weak var mobileTextField: UITextField!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
        self.objectCustomerLabel.text = self.product?.objectCustomer
        self.featureLabel.text = self.product?.feature
        self.mobileTextField.becomeFirstResponder()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == "Show Head" {
            var headVc = segue.destinationViewController as ShowOfflineHeadViewController
            headVc.delegate = self
            headVc.product = product
        }
        // Pass the selected object to the new view controller.
    }

    // MARK: - UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.mobileTextField.resignFirstResponder()
        self.mobile = self.mobileTextField.text
        return true
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
//        var newString = textField.text.stringByReplacingCharactersInRange(range: Range<String.Index>, withString: <#String#>)
//        if newString.isEmpty {
//            
//        }
        return true
    }
    
    // MARK: - ShowOfflineHeadViewControllerDelegate
    
    func showOfflineHeadViewControllerShouldReturn(viewController: UIViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    // MARK: - Actions
    
      func serviceButtonPressed() {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            let phoneUrl = NSURL(string: "telprompt://4008216888")
            UIApplication.sharedApplication().openURL(phoneUrl!)
        }
    }
    
    @IBAction func applyButtonPressed() {
        ZDWebService.sharedWebService().applyBusinessWithBusinessType(self.product?.name, mobile: self.mobile, city: "") { (error, object) -> Void in
            var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "请稍等"
            if error == nil {
                if (object["status"] as NSString) == "0" {
                    hud.labelText = "申请成功！"
                    hud.hide(true, afterDelay: 2)
                } else {
                    hud.labelText = "申请失败，请稍候"
                    hud.hide(true, afterDelay: 2)
                }
                
            } else {
                hud.labelText = "网络异常，请稍候"
                hud.hide(true, afterDelay: 2)
            }
        }
    }
    
}
