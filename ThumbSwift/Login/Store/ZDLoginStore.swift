//
//  ZDLoginStore.swift
//  ThumbSwift
//
//  Created by apple on 14/11/25.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

typealias ooo = (error: NSError!, resultDic: NSObject!) -> Void

class ZDLoginStore: NSObject {
    
    var currentCustomer: ZDCustomer?
    
    class var sharedInstance : ZDLoginStore {
            struct Static {
                static var onceToken : dispatch_once_t = 0
                static var instance : ZDLoginStore? = nil
            }
            dispatch_once(&Static.onceToken) {
                Static.instance = ZDLoginStore()
            }
            return Static.instance!
        }
    
    func loginAndSaveWithUserId(userId: NSString, password: NSString, completion: ooo) {
//        ZDWebService.sharedWebService().loginWithUserName(userId, password: password, completion: completion)
    }
        
}