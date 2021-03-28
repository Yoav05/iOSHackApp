//
//  NewsView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import SDWebImageSwiftUI

struct NewsView: View {
    
   private var viewModel: GuideModel
    
    init(viewModel: GuideModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10.0)
                .foregroundColor(.white)
                .shadow(color: Color(UIColor.gray.withAlphaComponent(0.2)), radius: 5, x: 0, y: 0)
            VStack(alignment: .leading) {
                HStack(alignment: .top) {
                    Text(viewModel.title ?? "")
                    .font(.title2)
                    .padding(.all, 0)
                    .multilineTextAlignment(.leading)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundColor(Color(viewModel.getColor()))
                        Text(viewModel.category?.name ?? "News")
                            .foregroundColor(.white)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    .frame(width: 70, height: 25, alignment: .leading)
                }
                WebImage(url: URL(string: viewModel.previewImage ?? viewModel.imageUrl ?? ""))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
                    .clipped()
                Text(viewModel.guideDescription ?? "")
                    .lineLimit(4)
                    .font(.footnote)
                HStack(alignment: .bottom) {
                    Image(systemName: "message")
                        .foregroundColor(Color.gray)
                    Text("\(Int.random(in: 11..<150))")
                        .foregroundColor(Color.gray)
                    Spacer()
                    HStack {
                        Image(systemName: "chevron.up")
                            .foregroundColor(Color.gray)
                        Text("\(viewModel.rating ?? 139)")
                            .foregroundColor(Color.green)
                        Image(systemName: "chevron.down")
                            .foregroundColor(Color.gray)
                    }
                }
                .padding(.top, 6)
            }
            .padding()
        }
        .padding()
    }
}


extension GuideModel {
    func getColor() -> UIColor {
        guard
            let hex = self.category?.color
        else { return UIColor.green }
        return UIColor.init(hex: hex)
    }
}

extension UIColor {
    convenience init(hex hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}
