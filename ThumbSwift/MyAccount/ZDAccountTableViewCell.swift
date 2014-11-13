//
//  ZDAccountTableViewCell.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

class ZDAccountTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!

    class func cellWithTableView(tableView: UITableView) -> ZDAccountTableViewCell? {
        var ID = "My account cell"
        var cell = tableView.dequeueReusableCellWithIdentifier(ID) as? ZDAccountTableViewCell
        if cell == nil {
            cell = ZDAccountTableViewCell(style:.Default, reuseIdentifier:ID)
        }
        
        return cell
    }
    
    func configViewWithData(data: (UIImage, NSString)) {
        self.iconImageView.image = data.0
        self.titleLabel.text = data.1
    }
    
}


