//
//  NewsView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    
   private var viewModel: NewsModel
    
    init(viewModel: NewsModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: Color(UIColor.gray.withAlphaComponent(0.2)), radius: 5, x: 0, y: 0)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(viewModel.title)
                    .font(.title2)
                    .padding(.all, 0)
                    .multilineTextAlignment(.leading)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.green)
                        Text("News")
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    .frame(width: 70, height: 25, alignment: .leading)
                }
                WebImage(url: URL(string: viewModel.previewImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .clipped()
                Text(viewModel.description)
                    .lineLimit(4)
                    .font(.footnote)
                HStack {
                    Image(systemName: "message")
                        .foregroundColor(Color.gray)
                    Text("129")
                        .foregroundColor(Color.gray)
                    Spacer()
                }
                .padding(.top, 6)
            }
            .padding()
        }
        .padding()
    }
}
