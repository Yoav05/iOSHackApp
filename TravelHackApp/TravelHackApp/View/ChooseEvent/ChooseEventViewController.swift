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
        button.setTitle("Поехали".uppercased(), for: .normal)
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 10
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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupUI() {
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.tintColor = .black
        navigationController?.setNavigationBarHidden(true , animated: false)
        let backBarButtton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButtton
        
        
        view.backgroundColor = UIColor.white
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        declineButton.addTarget(self, action: #selector(declineButtonTapped), for: .touchUpInside)
        acceptButton.addTarget(self, action: #selector(acceptButtonTapped), for: .touchUpInside)
        doneButton.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
    }
    
    private func setupLayout() {
        [exitButton, timeLabel, kolodaView, doneButton, acceptButton, declineButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([
            
            exitButton.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 12),
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            timeLabel.topAnchor.constraint(equalTo: exitButton.bottomAnchor, constant: 12),
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
        return 4
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        return CardView(
            imageUrl: "https://images.unsplash.com/photo-1547483029-77784da27709?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1568&q=80",
            title: "Tel aviv",
            distance: 4000.0
        )
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
}

extension ChooseEventViewController: KolodaViewDelegate {
    
}



