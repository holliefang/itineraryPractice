//
//  TripModel.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/26.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import Foundation

class TripModel {
    let id: UUID
    var title: String
    
    init(title: String) {
        id = UUID()
        self.title = title
    }
}
