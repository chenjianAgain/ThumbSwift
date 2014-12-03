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
    func segmentControlDidChanged(viewController:UIViewController, selectedIndex:NSInteger)
}

class ZDSelectionViewController: UIViewController {
    
    @IBOutlet weak var trailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var delegate: ZDSelectionViewControllerDelegate?
    var selectedIndex: NSInteger = 0
    
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var movingView: UIView!
    
    @IBAction func firstSegmentSelected(sender: AnyObject!) {
        self.selectedIndex = 0
        self.updateSegmentForSelectedIndex(0, button: sender as UIButton)
        self.delegate?.segmentControlDidChanged(self, selectedIndex: 0)
    }
    
    @IBAction func secondSegmentSelected(sender: AnyObject!) {
        self.selectedIndex = 1
        self.updateSegmentForSelectedIndex(1, button: sender as UIButton)
        self.delegate?.segmentControlDidChanged(self, selectedIndex: 1)
    }
    
    // MARK: - Private Method
    
    func updateSegmentForSelectedIndex(index: NSInteger, button: UIButton) {
        for button in self.buttons {
            button.selected = false
        }
        button.selected = true

        UIView.animateWithDuration(0.5, animations: {
            if self.selectedIndex == 1 {
                self.leadingConstraint.priority = 0
            } else {
                self.trailingConstraint.priority = 0
            }
        })
    }
}
