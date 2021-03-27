//
//  MainView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(viewModel.stories, id: \.self) { story in
                Text(story.circleTitle)
            }
        }.onAppear {
            viewModel.getStories()
        }
    }
}
