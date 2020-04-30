//
//  CheckBox.swift
//  beqalaApp
//
//  Created by Alaa Adel on 9/8/19.
//  Copyright © 2019 Alaa Adel. All rights reserved.
//

import UIKit

class CheckBox: UIButton {
    
    let checkImage = UIImage(named: "checked") as UIImage?
    let uncheckedImage = UIImage(named: "unchecked") as UIImage?
    
    var ischecked: Bool = false {
        didSet {
            if ischecked == true {
                self.setImage(checkImage, for: .normal)
            } else {
                self.setImage(uncheckedImage, for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        self.addTarget(self, action: #selector(buttonClicked(sender:)), for: .touchUpInside)
        self.ischecked = false
    }
    @objc func buttonClicked(sender: UIButton) {
        if (sender == self) {
            if ischecked == true {
                ischecked = false
            } else {
                ischecked = true
            }
        }
    }
}
