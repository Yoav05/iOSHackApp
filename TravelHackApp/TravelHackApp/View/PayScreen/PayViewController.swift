//
//  PayViewController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import SwiftUI
import UIKit

class PayScreenViewController: UIHostingController<PayScreen> {
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

struct PayScreen: View {
    
    private let viewModel: PayViewModel
    
    init(viewModel: PayViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack {
            Text("Экран оплаты")
            Spacer()
            payButton
        }
    }
    
    var payButton: some View {
        Button {
            viewModel.qrCodeScreen()
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
