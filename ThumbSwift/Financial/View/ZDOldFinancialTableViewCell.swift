//
//  FinancialTableViewCell.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDOldFinancialTableViewCell: UITableViewCell {

    var product: ZDProduct? {
        didSet {
            self.productNameLabel.text = product!.name
            self.predictInterestLabel.text = product!.predictInterest
            self.atLeastMoneyLabel.text = "起投金额 " + product!.atLeastMoney!
            self.closePeriodLabel.text = "封闭期 " + product!.closePeriod!
            self.iconImageView.image = UIImage(named: product!.icon!)
        }
    }

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var predictInterestLabel: UILabel!
    @IBOutlet weak var atLeastMoneyLabel: UILabel!
    @IBOutlet weak var closePeriodLabel:UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    class func cellWithTableView(tableView: UITableView) -> ZDOldFinancialTableViewCell? {
        var ID = "old financial cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? ZDOldFinancialTableViewCell
        if cell == nil {
            cell = ZDOldFinancialTableViewCell(style:.Default, reuseIdentifier:ID)
        }
        
        return cell
    }

}
