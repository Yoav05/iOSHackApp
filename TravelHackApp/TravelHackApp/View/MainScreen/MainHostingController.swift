//
//  MainHostingController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 28.03.2021.
//

import SwiftUI
import MapKit

class MainHostingController: UIHostingController<MainView> {
    
    private let locationManager = CLLocationManager()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.setNavigationBarHidden(true , animated: false)
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false , animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard CLLocationManager.locationServicesEnabled() else {
          return
        }
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
//        locationManager.delegate = self
        if CLLocationManager.authorizationStatus() == .notDetermined {
          locationManager.requestWhenInUseAuthorization()
        } else {
          locationManager.requestLocation()
        }
        
    }
}
