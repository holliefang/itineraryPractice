//
//  PopupUIView.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/27.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class PopupUIView: UIView {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.cornerRadius = 10
        
        backgroundColor = Theme.background
    }
}
