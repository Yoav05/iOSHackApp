//
//  RoutScreenViewController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import UIKit
import MapKit

class RoutScreenViewController: UIHostingController<RoutScreen> {
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

struct RoutScreen: View {
    
    private let viewModel: RoutViewModel
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 55.751244, longitude: 37.618423), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))


        
    init(viewModel: RoutViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            Text("Ваш маршут")
            ScrollView{
                Map(coordinateRegion: $region, annotationItems: viewModel.points) { point in
                    MapAnnotation(coordinate: point.coordinate, anchorPoint: CGPoint(x: 0.5, y: 0.5)) {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(UIColor.systemRed.withAlphaComponent(0.5)))
                    }
                }
                .frame(height: 300)
                VStack(spacing: 0){
                    ForEach(0..<viewModel.items.count, id: \.self) { index in
                        ContentCellView(viewModel: viewModel.items[index], isLast: index == viewModel.items.count - 1)
                    }
                }
                .padding()
            }
            Spacer()
            payButton
        }
    }
    
    var payButton: some View {
        Button {
            viewModel.payScreen()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.systemGreen))
                Text("Оплатить")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(height: 45)
        }
        .buttonStyle(PlainButtonStyle())
        .padding()

    }
}

struct ContentCellView: View {
    var isLast: Bool = false
    
    let viewModel: GuideModel
    
    init(viewModel: GuideModel, isLast: Bool) {
        self.viewModel = viewModel
        self.isLast = isLast
    }
    
    var body: some View {
        VStack(alignment: HorizontalAlignment.leading, spacing: 0) {
            HStack {
                Image(systemName: "message.circle").frame(width: 30)
                Text(viewModel.title ?? "")
                Spacer()
                Text("Время \(viewModel.time ?? 0.0, specifier: "%.2f") ч.")
            }
            if !isLast {
                Rectangle().fill(Color.blue).frame(width: 1, height: 14, alignment: .center).padding(.leading, 15.5)//.offset(y: -10)
            }
        }
    }
}
