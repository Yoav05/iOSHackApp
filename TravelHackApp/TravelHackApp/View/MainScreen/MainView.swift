//
//  MainView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct MainView: View {
    
    @ObservedObject private var viewModel: MainViewModel
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
                HeaderView().environmentObject(viewModel)
                StoryView().environmentObject(viewModel)
                    .padding(.bottom)
                NewsArrayView().environmentObject(viewModel)
                Spacer()
            }
        }
        .padding(.vertical)
        .onAppear {
            viewModel.getStories()
            viewModel.getGuide()
        }
    }
}
