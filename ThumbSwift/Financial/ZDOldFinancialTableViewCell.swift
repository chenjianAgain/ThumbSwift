//
//  FinancialTableViewCell.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOldFinancialTableViewCell: UITableViewCell {

    var item: ZDOldFinancialItem? {
        didSet {
            self.itemNameLabel!.text = item!.itemName
        }
    }
    
    @IBOutlet weak var itemNameLabel: UILabel?
    
    class func cellWithTableView(tableView: UITableView) -> ZDOldFinancialTableViewCell? {
        var ID = "old financial cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? ZDOldFinancialTableViewCell
        if cell == nil {
            cell = ZDOldFinancialTableViewCell(style:.Default, reuseIdentifier:ID)
        }
        
        return cell
    }

}
