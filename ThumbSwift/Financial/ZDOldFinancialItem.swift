//
//  ZDOldFinancialItem.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOldFinancialItem: NSObject {
    var itemName: NSString?
    
    override init() {
        super.init()
    }
    
    init(itemName: NSString) {
        super.init()
        self.itemName = itemName
    }
}
