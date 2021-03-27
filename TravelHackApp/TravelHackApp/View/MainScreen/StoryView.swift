//
//  StoryView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoryView: View {
    
    enum Layout {
        static let storyHeight: CGFloat = 80
    }
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.stories, id: \.self) { story in
                    VStack {
                        WebImage(url: URL(string: story.circleImageUrl))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: Layout.storyHeight, height: Layout.storyHeight, alignment: .center)
                            .cornerRadius(Layout.storyHeight / 2)
                            .clipped()
                        Text(story.circleTitle)
                            .font(.footnote)
                            .frame(width: Layout.storyHeight, alignment: .center)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                }
            }
            .padding()
        }
//        .padding()
    }
}

