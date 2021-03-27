//
//  QrViewController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import UIKit

class QrScreenViewController: UIHostingController<QrScreen> {
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

struct QrScreen: View {
    
    private let viewModel: QrViewModel
    
    init(viewModel: QrViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            Text("Экран с QR кодом")
            Spacer()
            payButton
        }
    }
    
    var payButton: some View {
        Button {
            viewModel.nextAction()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color(UIColor.systemGreen))
                Text("Готово")
                    .font(.headline)
                    .foregroundColor(.white)
            }
            .frame(height: 45)
        }
        .buttonStyle(PlainButtonStyle())
        .padding()

    }
}
