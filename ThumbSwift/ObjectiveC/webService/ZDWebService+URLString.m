//
//  ZDWebService+URLString.m
//  Thumb
//
//  Created by peter on 14/11/11.
//  Copyright (c) 2014年 peter. All rights reserved.
//

#import "ZDWebService+URLString.h"

@implementation ZDWebService (URLString)

//登录
- (NSString *)URLStringForLogin
{
    return @"/account/userLogin";
}

//注册
- (NSString *)URLStringForRegister
{
    return @"/account/register";
}

//获取验证码
- (NSString *)URLStringForGetValidateCode
{
    return @"/account/getValidateCode";
}

//身份证绑定
- (NSString *)URLStringForIdCardBind
{
    return @"/account/idCardBind4App";
}

//忘记密码后重设密码
- (NSString *)URLStringForForgetAndResetPassword
{
    return @"/account/resetPassword";
}

//获取网点
- (NSString *)URLStringForGetNetSite
{
    return @"/account/getNetSite";
}

//修改密码
- (NSString *)URLStringForUpdatePassword
{
    return @"/account/updatePassword";
}

//提交订单
- (NSString *)URLStringForSubmitProductOrder
{
    return @"/busiFinance/saveBusiFinance4APP";
}

//线下理财申请
- (NSString *)URLStringForApplyBusiness
{
    return @"/credit/applyBusiness";
}

//意见反馈
- (NSString *)URLStringForCommitFeedback
{
    return @"/manageraccount/commitFeedback";
}

//获取理财产品列表
- (NSString *)URLStringForGetProductLists
{
    return @"/busiFinance/getProductByTypeOrId";
}

//获取客户经理信息
- (NSString *)URLStringForGetManagerInfo
{
    return @"/account/newGetManagerFromApp";
}

//获取某个客户订单列表
- (NSString *)URLStringForGetProductOrderListsOfCustomer
{
    return @"/busiFinance/newQueryBusiness";
}

//获取交易明细列表
- (NSString *)URLStringForGetTransactoinDetailOfCustomer
{
    return @"/busiFinance/getTransactionDetails";
}

//获取债券列表
- (NSString *)URLStringForGetLoanList
{
    return @"/busiFinance/getLoanList";
}

@end
