//
//  ZDCommonSenseViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/2.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDCommonSenseViewController: UIViewController {
    
    var onlineHtml: NSString?
    var navigationTitle: NSString?
    
    @IBOutlet weak var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        if self.onlineHtml != nil {
            var urlRequest = NSURLRequest(URL: NSURL(string: self.onlineHtml!)!)
            self.webView.loadRequest(urlRequest)
        }
        
        if self.navigationController != nil {
            self.title = self.navigationTitle
        }
        // Do any additional setup after loading the view.
    }
}
