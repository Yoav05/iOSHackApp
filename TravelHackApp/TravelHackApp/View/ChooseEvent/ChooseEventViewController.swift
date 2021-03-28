//
//  ChooseEventViewController.swift
//  TravelHackApp
//
//  Created by Yoav Nemirovsky on 27.03.2021.
//

import UIKit
import Koloda

final class ChooseEventViewController: UIViewController {
    
    private let viewModel: ChooseEventViewModel
    
    private var timeCounter: Double = 0
    
    init(viewModel: ChooseEventViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let exitButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 25, weight: .regular)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.text = "0 часов"
        return label
    }()
    
    private lazy var doneButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Поехали", for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        return button
    }()
    
    private lazy var declineButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold)
        button.setImage(UIImage(systemName: "xmark", withConfiguration: config), for: .normal)
        button.tintColor = UIColor.systemRed
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        button.layer.cornerRadius = 30
        return button
    }()
    
    private lazy var acceptButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .bold)
        button.setImage(UIImage(systemName: "checkmark", withConfiguration: config), for: .normal)
        button.tintColor = UIColor.systemGreen
        button.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        button.layer.cornerRadius = 30
        return button
    }()
    
    private lazy var kolodaView: KolodaView = {
        let view = KolodaView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLayout()
        kolodaView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    private func setupUI() {
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        
        view.backgroundColor = UIColor.white
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        declineButton.addTarget(self, action: #selector(declineButtonTapped), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        [timeLabel, kolodaView, doneButton, acceptButton, declineButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            timeLabel.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            kolodaView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 20),
            kolodaView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            kolodaView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            kolodaView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),
            
            declineButton.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 24),
            declineButton.leadingAnchor.constraint(equalTo: kolodaView.leadingAnchor, constant: 60),
            declineButton.heightAnchor.constraint(equalToConstant: 60),
            declineButton.widthAnchor.constraint(equalToConstant: 60),
            
            acceptButton.topAnchor.constraint(equalTo: kolodaView.bottomAnchor, constant: 24),
            acceptButton.trailingAnchor.constraint(equalTo: kolodaView.trailingAnchor, constant: -60),
            acceptButton.heightAnchor.constraint(equalToConstant: 60),
            acceptButton.widthAnchor.constraint(equalToConstant: 60),
            
            doneButton.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            doneButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            doneButton.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            doneButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
    @objc private func exitButtonTapped() {
        viewModel.dismissController()
    }
    
    @objc private func acceptButtonTapped() {
        kolodaView.swipe(.right)
    }
    
    @objc private func declineButtonTapped() {
        kolodaView.swipe(.left)
    }
    
    @objc private func doneButtonTapped() {
        viewModel.nextScreen()
    }
}

extension ChooseEventViewController: KolodaViewDataSource {
    
    func kolodaNumberOfCards(_ koloda: KolodaView) -> Int {
        return viewModel.items.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return CardView(guideModel: viewModel.items[index])
    }
    
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    
    func koloda(_ koloda: KolodaView, allowedDirectionsForIndex index: Int) -> [SwipeResultDirection] {
        [.left, .right]
    }
    
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        // TODO: - Отобразить что-то
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return CustomOverlayView()
    }
    
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .right:
            timeCounter += 1.5 * Double.random(in: 0.5..<1.0)
            timeLabel.text = "Маршрут займет \(Double(round(timeCounter * 100)/100)) ч."
            viewModel.items[index].time = timeCounter
            viewModel.addedPlaces.append(viewModel.items[index])
        default:
            break
        }
    }
}

extension ChooseEventViewController: KolodaViewDelegate {
    
}



