//
//  Product.swift
//  ThumbSwift
//
//  Created by apple on 14/11/16.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class Product: NSObject {
    var productId: NSString?
    var icon: NSString?
    var name: NSString?
    var closePeriod: NSString?
    var predictInterest: NSString?
    var atLeastMoney: NSString?
    var feature: NSString?
    var objectCustomer: NSString?
    
    init(dic: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dic)
    }
    
}
