//
//  ZDCustomer.swift
//  ThumbSwift
//
//  Created by apple on 14/11/25.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDCustomer: NSObject {
    var idnum: NSString?//客户身份证
    var customerType: NSString?//客户类型：1储备客户 未做业务2. 客户  新客户，有一笔正在做的业务3. 老客户 有一笔及以上投资结束的业务4. 合作伙伴5. 竞争对手6. 黑名单
    var managerCode: NSString?//客户经理邀请码
    var managerId: NSString?
    var customerId: NSString?
    var managerMobile: NSString?
    var customerNumber: NSString?//客户编号
    var depName: NSString?//客户经理部门名称
    var managerName: NSString?//客户经理名称
//    var mobile: NSString?//用户手机，也是用户账户名
//    var mrIdnum: NSString?//客户身份证号
//    var mrName: NSString?//用户名字
//    var mrMemberState: NSString?//是否绑定理财账户的状态,2是已绑定
    
    init(dic: NSDictionary) {
        super.init()
        self.setValuesForKeysWithDictionary(dic)
    }
}
