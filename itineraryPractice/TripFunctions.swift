//
//  TripFunctions.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/26.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import Foundation

class TripFunctions {
    static func createTrip(tripModel: TripModel) {
        Data.tripModels.append(tripModel)
        
    }
    
    static func readTrip(completion: @escaping () -> ()) {
        DispatchQueue.global(qos: .userInteractive).async {
            if Data.tripModels.count == 0 {
                Data.tripModels.append(TripModel(title: "Trip to China!"))
                Data.tripModels.append(TripModel(title: "Mexico"))
            }
        DispatchQueue.main.async {
            completion()
        }
        
        }
    }
    
    static func updateTrip(tripModel: TripModel) {
        
    }
    
    static func deleteTrip(tripModel: TripModel) {
        
    }
}
