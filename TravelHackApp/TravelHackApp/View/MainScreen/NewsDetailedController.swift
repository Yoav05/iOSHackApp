//
//  NewsDetailedController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 28.03.2021.
//

import SwiftUI

class NewsDetailedController: UIHostingController<NewsDetailedScreen> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false , animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true , animated: false)
    }
}

