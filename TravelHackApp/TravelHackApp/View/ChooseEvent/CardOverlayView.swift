//
//  CardOverlayView.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import UIKit
import Koloda

class CustomOverlayView: OverlayView {
    private lazy var overlayImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        overlayImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(overlayImageView)
        NSLayoutConstraint.activate([
            overlayImageView.topAnchor.constraint(equalTo: topAnchor),
            overlayImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            overlayImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            overlayImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var overlayState: SwipeResultDirection? {
        didSet {
            switch overlayState {
            case .left:
                overlayImageView.image = UIImage(named: "overlay_skip")
            case .right:
                overlayImageView.image = UIImage(named: "overlay_like")
            default:
                overlayImageView.image = nil
            }
        }
    }
}
