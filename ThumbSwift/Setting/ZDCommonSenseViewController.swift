//
//  ZDCommonSenseViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDCommonSenseViewController: UIViewController, UIWebViewDelegate {
    
    var onlineHtml: NSString?
    var navigationTitle: NSString?
    var progressView: UIProgressView?
    var timer: NSTimer?
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.onlineHtml != nil {
            var urlRequest = NSURLRequest(URL: NSURL(string: self.onlineHtml!)!)
            self.webView.delegate = self
            self.webView.loadRequest(urlRequest)
        }
        
        if self.navigationController != nil {
            self.title = self.navigationTitle
        }

        progressView = UIProgressView(progressViewStyle: .Bar)
        let y = self.navigationController?.navigationBar.frame.maxY
        progressView?.frame = CGRectMake(0, y!, view.frame.width, 1)
//                progressView?.center = view.center
        progressView?.progress = 1 / 4
        progressView?.trackTintColor = UIColor.lightGrayColor()
        progressView?.tintColor = UIColor.orangeColor()
        view.addSubview(progressView!)
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "refreshProgressView", userInfo: nil, repeats: true)
    }
    
    func refreshProgressView() {
        progressView?.progress += 1 / 4
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        progressView?.hidden = true
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true

    }
}
