//
//  AddTripViewController.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/27.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {

    @IBOutlet weak var TripTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    
    var doneSaving: (() -> ())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
    }
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func save(_ sender: Any) {
        TripFunctions.createTrip(tripModel: TripModel(title: TripTextField.text!))
        
        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }
}
