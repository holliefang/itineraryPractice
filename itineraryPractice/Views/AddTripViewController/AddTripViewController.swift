    //
    //  AddTripViewController.swift
    //  itineraryPractice
    //
    //  Created by Sihan Fang on 2018/10/27.
    //  Copyright © 2018 Sihan Fang. All rights reserved.
    //

    import Photos
    import UIKit

    class AddTripViewController: UIViewController {

    @IBOutlet weak var TripTextField: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var imagaView: UIImageView!

    var doneSaving: (() -> ())?
    var tripIndexToEdit: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLabel.font = UIFont(name: Theme.mainFontName, size: 24)
        imagaView.layer.cornerRadius = 10
        
        // Dropshadow on title
        titleLabel.layer.shadowOpacity = 1
        titleLabel.layer.shadowColor = UIColor.white.cgColor
        titleLabel.layer.shadowOffset = CGSize.zero
        titleLabel.layer.cornerRadius = 5
        
        if let index = tripIndexToEdit {
            let trip = Data.tripModels[index]
            titleLabel.text = "Edit Trip"
            TripTextField.text = trip.title
            imagaView.image = trip.image
            
        }
    }

    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true)
    }

    @IBAction func save(_ sender: Any) {
        TripTextField.rightViewMode = .never
        
        guard TripTextField.text != "", let newTripName = TripTextField.text else {
           
            //show warning icon
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
            imageView.image = UIImage(named: "icons8-error-48")
            imageView.contentMode = .scaleAspectFit
            TripTextField.rightViewMode = .always
            TripTextField.rightView = imageView
            
            //show red background
    //            TripTextField.backgroundColor = #colorLiteral(red: 0.9525896256, green: 0.3187139993, blue: 0.3022343031, alpha: 1)
            
            //red boarder
    //            TripTextField.layer.borderColor = UIColor.red.cgColor
    //            TripTextField.layer.borderWidth = 1
    //            TripTextField.layer.cornerRadius = 5
    //
            TripTextField.placeholder = "Please enter something!"
            
            
            return
        }
        
        if let index = tripIndexToEdit {
            TripFunctions.updateTrip(at: index, title: newTripName, image: imagaView.image)
            } else {
            TripFunctions.createTrip(tripModel: TripModel(title: newTripName, image: imagaView.image))

        }

        if let doneSaving = doneSaving {
            doneSaving()
        }
        dismiss(animated: true)
    }

    fileprivate func presentPhotoPickerController() {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self
        myPickerController.sourceType = .photoLibrary
        self.present(myPickerController, animated: true)
    }

    @IBAction func addPhoto(_ sender: UIButton) {
            PHPhotoLibrary.requestAuthorization { (status) in
                switch status {
                case .authorized:
                   self.presentPhotoPickerController()
                case .notDetermined:
                    if status == PHAuthorizationStatus.authorized {
                        self.presentPhotoPickerController()
                    }
                case .restricted:
                    let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library is restricted and cannnot be accessed", preferredStyle: .alert)
                    let OKAction = UIAlertAction(title: "OK", style: .default)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true)
                case .denied:
                    let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library was previously denied. Please update your Settings.", preferredStyle: .alert)
                    let goToSettingAction = UIAlertAction(title: "Go to Settings", style: .default, handler: { (action) in
                        DispatchQueue.main.async {
                            if let url = URL(string: UIApplication.openSettingsURLString) {
                            UIApplication.shared.open(url, options: [:])
                            }
                            
                        }
                    })
                    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
                    alert.addAction(goToSettingAction)
                    alert.addAction(cancelAction)
                    self.present(alert, animated: true)

                }
            }
        
    }


    }


    extension AddTripViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            self.imagaView.image = image
        }
        
        dismiss(animated: true)
    }

    }
