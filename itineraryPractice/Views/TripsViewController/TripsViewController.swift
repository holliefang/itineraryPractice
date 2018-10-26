//
//  TripsViewController.swift
//  itineraryPractice
//
//  Created by Sihan Fang on 2018/10/26.
//  Copyright © 2018 Sihan Fang. All rights reserved.
//

import UIKit

class TripsViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        TripFunctions.readTrip(completion:  { [weak self] in
            self?.tableView.reloadData()
        })
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
           cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = Data.tripModels[indexPath.row].title
        
        return cell!
    }
    
}
