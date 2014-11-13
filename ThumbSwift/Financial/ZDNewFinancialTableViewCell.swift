//
//  ZDNewFinancialTableViewCell.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDNewFinancialTableViewCell: UITableViewCell {

    class func cellWithTableView(tableView: UITableView) -> ZDNewFinancialTableViewCell? {
        var ID = "new financial cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? ZDNewFinancialTableViewCell
        if cell == nil {
            cell = ZDNewFinancialTableViewCell(style:.Default, reuseIdentifier:ID)
        }
        
        return cell
    }

}
