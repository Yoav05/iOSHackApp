//
//  NewsDetailedScreen.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 28.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsDetailedScreen: View {
    
    private let viewModel: GuideModel
    
    init(viewModel: GuideModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(Color(viewModel.getColor()))
                Text(viewModel.category?.name ?? "News")
                    .foregroundColor(.white)
                    .font(.body)
                    .fontWeight(.bold)
            }
            .frame(width: 70, height: 25, alignment: .center)
            VStack(alignment: .leading) {
                Text(viewModel.title ?? "" )
                    .font(.title)
                    .padding([.horizontal, .top])
                Text(viewModel.guideDescription ?? "")
                    .font(.caption)
                    .padding(.horizontal)
                WebImage(url: URL(string: viewModel.previewImage ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                ForEach(viewModel.blocks!, id: \.self) { block in
                    Text(block.title ?? "" )
                        .font(.title)
                        .padding([.horizontal, .top])
                    Text(block.blockDescription ?? "")
                        .font(.caption)
                        .padding(.horizontal)
                    WebImage(url: URL(string: block.image ?? ""))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .clipped()
                }
            }
        }
    }
}
