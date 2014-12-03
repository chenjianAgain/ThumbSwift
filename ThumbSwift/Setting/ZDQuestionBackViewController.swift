//
//  ZDQuestionBackViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/1.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDQuestionBackViewControllerDelegate {
    func questionBackViewControllerDidSuccess(viewController: UIViewController)
}

class ZDQuestionBackViewController: UIViewController, UITextViewDelegate {

    @IBOutlet var placeHolderLabel: UILabel!
    @IBOutlet var feedBackTextView: UITextView!
    weak var delegate: ZDQuestionBackViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.feedBackTextView.becomeFirstResponder()
    }
    
    func textViewDidChange(textView: UITextView) {
        self.placeHolderLabel.hidden = !textView.text.isEmpty
    }

    @IBAction func submitButtonClicked() {
        if shouldSubmit() {
            doSubmitAction()
        }
    }
    
    func shouldSubmit() -> Bool {
        if self.feedBackTextView.text.isEmpty {
            let alertVc = UIAlertController(title: "", message: "请填写反馈内容", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default) { action -> Void in
                alertVc.dismissViewControllerAnimated(true, completion: nil)
            }
            alertVc.addAction(okAction)
            self.presentViewController(alertVc, animated: true, completion: nil)
            return false
        }
        return true
    }
    
    func doSubmitAction() {
        var hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "请稍候";

        let userName = NSUserDefaults.standardUserDefaults().objectForKey("DefaultUserNameKey") == nil ? "" : NSUserDefaults.standardUserDefaults().objectForKey("DefaultUserNameKey") as NSString
        var formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var operDate = formatter.stringFromDate(NSDate())
        var appVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as NSString
        var iosVersion = UIDevice.currentDevice().systemVersion

        
        ZDWebService.sharedWebService().commitFeedbackWithUserName(userName, context: self.feedBackTextView.text, operDate: operDate, appType: "iphone", appVersion: appVersion, system: "ios", systemVersion: iosVersion, source: "2", feedbackType: "1",  completion: { (error, resultDic) -> Void in
            let result = resultDic["status"] as NSString
            if error == nil && result.isEqualToString("0") {
                hud.hidden = true
                if self.delegate != nil {
                    self.delegate?.questionBackViewControllerDidSuccess(self)
                }
            } else {
                hud.labelText = "意见反馈失败,请稍后重试"
                hud.hide(true, afterDelay: 1)
            }
        })
    }
}
