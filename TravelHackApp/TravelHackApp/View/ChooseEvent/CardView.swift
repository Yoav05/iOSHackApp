//
//  CardView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import UIKit
import SDWebImage

final class CardView: UIView {
    
    private let lon: Double = 55.72222
    private let lat: Double = 37.55192
     
    let guideModel: GuideModel
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        let url = URL(string: guideModel.previewImage ?? "")
        imageView.sd_setImage(with: url, completed: nil)
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = guideModel.title
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var distanceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(Int.random(in: 3..<30)) км"
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.textColor = UIColor.white
        return label
    }()
    
    init(
        guideModel: GuideModel
    ) {
        self.guideModel = guideModel
        super.init(frame: .zero)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [imageView, titleLabel, distanceLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            distanceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            distanceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            titleLabel.bottomAnchor.constraint(equalTo: distanceLabel.topAnchor, constant: -6),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
