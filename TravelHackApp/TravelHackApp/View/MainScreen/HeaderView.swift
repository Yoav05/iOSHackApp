//
//  HeaderView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            burger
            Spacer()
            cityButton
            Spacer()
            rout
        }
        .padding()
    }
    
    var burger: some View {
        Button {
            // TODO: - Позже
        } label: {
            VStack {
                Image(systemName: "line.horizontal.3")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var rout: some View {
        Button {
            viewModel.showKolodaScreen()
        } label: {
            VStack {
                Image(systemName: "wand.and.stars")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
    
    var cityButton: some View {
        Button {
            // TODO: -
        } label: {
            HStack {
                Text("Москва")
                    .foregroundColor(.black)
                    .font(.headline)
                Image(systemName: "chevron.down")
                    .font(.system(size: 20, weight: .bold, design: .default))
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
