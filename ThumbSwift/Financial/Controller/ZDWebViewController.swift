//
//  ZDWebViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/12/8.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDWebViewController: UIViewController {
    
    @IBOutlet var webView: UIWebView!

    override func viewDidLoad() {
        super.viewDidLoad()

        var urlRequest = NSURLRequest(URL: NSURL(string: "http://api.ezendai.com:8888/cm/V2/HTML/activity.html")!)
        self.webView.loadRequest(urlRequest)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
