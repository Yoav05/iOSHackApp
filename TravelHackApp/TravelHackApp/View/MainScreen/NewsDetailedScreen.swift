//
//  NewsDetailedScreen.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 28.03.2021.
//

import SwiftUI

struct NewsDetailedScreen: View {
    
    private let viewModel: GuideModel
    
    init(viewModel: GuideModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Hello world")
            
        }
    }
}
