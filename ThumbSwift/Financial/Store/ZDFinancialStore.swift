//
//  FinancialStore.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDFinancialStore: NSObject {
    
    private var _products: NSMutableArray?
    var products: NSMutableArray? {
        get {
            if _products == nil {
                _products = self.getProducts("product")
            }
            return _products
        }
    }
    
    private var _onlineProducts: NSMutableArray?
    var onlineProducts: NSMutableArray? {
        get {
            if _onlineProducts == nil {
                _onlineProducts = self.getProducts("onlineProduct")
            }
            return _onlineProducts
        }
    }
    
    func getProducts(fileName: NSString) -> NSMutableArray? {

            var file = NSBundle.mainBundle().pathForResource(fileName, ofType: "plist")!
            var dicArray = NSArray(contentsOfFile: file)
            
            var mutableArray = NSMutableArray()
            
            for dic in dicArray! {
                var product = ZDProduct(dic: dic as NSDictionary)
                mutableArray.addObject(product)
            }
            
            return mutableArray
    }
    
    class var sharedInstance : ZDFinancialStore {
        struct Static {
            static var onceToken : dispatch_once_t = 0
            static var instance : ZDFinancialStore? = nil
        }
        dispatch_once(&Static.onceToken) {
            Static.instance = ZDFinancialStore()
        }
        return Static.instance!
    }

}
