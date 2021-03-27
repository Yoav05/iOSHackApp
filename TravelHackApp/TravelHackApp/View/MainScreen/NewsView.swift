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
                WebImage(url: URL(string: viewModel.previewImage ?? ""))
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
            let hex = self.category?.color,
            let color = UIColor.init(hex: hex)
        else { return UIColor.green }
        return color
    }
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
