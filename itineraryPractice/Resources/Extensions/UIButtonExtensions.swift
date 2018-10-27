//
//  UIButtonExtensions.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/27.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

extension UIButton {
    
    func styleAsFloatingButton() {
    
        layer.backgroundColor = Theme.tint?.cgColor
        layer.cornerRadius = frame.height / 2
        layer.shadowOpacity = 0.25
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 0, height: 8 )
    }

    
}
