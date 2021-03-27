//
//  NewsArrayView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI

struct NewsArrayView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        ForEach(viewModel.guides, id: \.self) { guideModel in
            NewsView(viewModel: guideModel)
        }
    }
}
