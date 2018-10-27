//
//  TripsTableViewCell.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/26.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class TripsTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cardView.addShadowAndRoundedCorner()
        titleLabel.font = UIFont(name: "Righteous-Regular", size: 32)
        cardView.backgroundColor = Theme.accent

    }
    
    func setup(tripModel: TripModel) {
        titleLabel.text = tripModel.title
    }

}
