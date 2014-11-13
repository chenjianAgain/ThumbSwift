//
//  ZDSelectionViewController.swift
//  ThumbSwift
//
//  Created by apple on 14/11/13.
//  Copyright (c) 2014年 zendaimoney. All rights reserved.
//

import UIKit

@objc
protocol ZDSelectionViewControllerDelegate {
    func segmentControlDidChanged(view:UIView, selectedIndex:NSInteger)
}

class ZDSelectionViewController: UIViewController {
    
    var delegate: ZDSelectionViewControllerDelegate?
    var selectedIndex: NSInteger = 0
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var movingView: UIView!
    
    @IBAction func firstSegmentSelected() {
        
    }
    
    @IBAction func secondSegmentSelected() {
        
    }
    
    // MARK: - Private Method
    
    func updateSegmentForSelectedIndex(index: NSInteger, button: UIButton) {
        for button in self.buttons {
            button.selected = false
        }
//        button.seleceted = true
//        
//        UIView.animateWithDuration(delay: 0.5, animations:nil)
    }
}
