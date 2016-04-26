//
//  CustomButton.swift
//  Dreamland
//
//  Created by Dulio Denis on 4/23/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.setupView()
    }
    
    func setupView() {
        layer.cornerRadius = 4.0
        layer.shadowColor = UIColor(red: BUTTON_SHADOW_COLOR, green: BUTTON_SHADOW_COLOR, blue: BUTTON_SHADOW_COLOR, alpha: 0.7).CGColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSizeMake(0.0, 2.0)
        backgroundColor = BUTTON_COLOR
        setTitleColor(UIColor.whiteColor(), forState: .Normal)
    }
    
}
