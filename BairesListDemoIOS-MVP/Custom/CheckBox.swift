//
//  CheckBox.swift
//  BairesListDemoIOS-MVP
//
//  Created by NeoNHugo on 8/16/18.
//  Copyright © 2018 NeoNHugo. All rights reserved.
//
//  Control created to allow the emulation of a CheckBox

import UIKit

// A Protocol to detect a change in the control to allow a data change
protocol CheckBoxDelegate {
    func changedStatus(id: Int, status: Bool)
}

class CheckBox: UIButton {
    
    var delegate: CheckBoxDelegate?
    var idrow: Int = -1
    var canChange = false
    
    // Images
    let checkedImage = UIImage(named: "heart_on")! as UIImage
    let uncheckedImage = UIImage(named: "heart_off")! as UIImage
    
    
    // Bool property
    var isChecked: Bool = false {
        didSet{
            if isChecked == true {
                self.setImage(checkedImage, for: UIControlState.normal)
            } else {
                self.setImage(uncheckedImage, for: UIControlState.normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControlEvents.touchUpInside)
        self.isChecked = false
        //
        imageEdgeInsets = UIEdgeInsets(top: 35, left: 35, bottom: 35, right: 35)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            if (self.canChange){
                isChecked = !isChecked
                
                if (delegate != nil){
                    delegate?.changedStatus(id: idrow, status: isChecked)
                }
            }
        }
    }
    

}
