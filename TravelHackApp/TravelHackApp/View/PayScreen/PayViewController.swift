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
    @State private var cardNumber: String = "0000 1111 2222 3333"
    @State private var date: String = "08/24"
    @State private var cvv: String = "377"
    
    
    init(viewModel: PayViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Оплата маршрута")
                .font(.headline)
            VStack(alignment: .leading) {
                Text("Номер карты")
                    .font(.title3)
                    .foregroundColor(.gray)
                TextField("0000 1111 2222 3333", text: $cardNumber)
                    .font(.title2)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("Дата")
                    .font(.title3)
                    .foregroundColor(.gray)
                TextField("08/24", text: $date)
                    .font(.title2)
            }
            .padding()
            
            VStack(alignment: .leading) {
                Text("CVV")
                    .font(.title3)
                    .foregroundColor(.gray)
                TextField("***", text: $cvv)
                    .frame(alignment: .trailing)
                    .font(.title2)
            }
            .padding()
            VStack(alignment: .trailing) {
            Text("К оплате:")
                .font(.title3)
                .foregroundColor(.gray)
            Text("\(Int.random(in: 500...1000) * viewModel.items.count) ₽")
                .font(.title2)
            }.padding()

        }

        Spacer()
        payButton
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
