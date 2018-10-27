//
//  AppUIButton.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/27.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class AppUIButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2.5
        setTitleColor(UIColor.white, for: .normal)
     

    }
    
}
