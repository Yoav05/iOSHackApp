//
//  GuideView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct GuideView: View {
    
    @EnvironmentObject private var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: Color(UIColor.gray.withAlphaComponent(0.2)), radius: 5, x: 0, y: 0)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                Text(viewModel.guide.title)
                    .font(.title2)
                    .padding(.all, 0)
                    .multilineTextAlignment(.leading)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(.purple)
                        Text("Guide")
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    .frame(width: 70, height: 25, alignment: .leading)
                }
                Text(viewModel.guide.description)
                    .lineLimit(4)
                    .font(.footnote)
                WebImage(url: URL(string: viewModel.guide.previewImageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .clipped()
                HStack {
                    Image(systemName: "message")
                        .foregroundColor(Color.gray)
                    Text("129")
                        .foregroundColor(Color.gray)
                    Spacer()
                    HStack {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color.gray)
                        Text("\(viewModel.guide.raiting)")
                            .foregroundColor(Color.green)
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.gray)
                    }
                }
            }
            .padding()
        }
        .padding()
    }
}
