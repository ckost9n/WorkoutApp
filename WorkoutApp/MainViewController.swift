//
//  MainViewController.swift
//  WorkoutApp
//
//  Created by Konstantin on 14.06.2022.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    // MARK: - UI Elements
    
    private let sideIndents = 10
    
    private let userImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .specialLightGray
        imageView.layer.borderWidth = 5
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let element = UILabel()
        element.text = "Konstantin Chukarkov"
        element.font = .robotoMedium24()
        element.adjustsFontSizeToFitWidth = true
        element.minimumScaleFactor = 0.6
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let calendarView: UIView = {
        let element = UIView()
        element.backgroundColor = .specialGreen
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    private let addWorkoutButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        
        configuration.baseBackgroundColor = .specialYellow
        configuration.baseForegroundColor = .specialDarkGreen
        
        var text = AttributeContainer()
        text.font = .robotoMedium12()
        
        configuration.attributedTitle = AttributedString("Add workout", attributes: text)
        configuration.image = UIImage(named: "addWorkout")
        
        configuration.imagePlacement = .top
//        configuration.imagePadding = -10
        configuration.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        let element = UIButton(configuration: configuration)

        
        element.addShadowOnView()
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLayoutSubviews() {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2
        calendarView.layer.cornerRadius = 10
        addWorkoutButton.layer.cornerRadius = 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .specialBackground
        
        setupViews()
        setConstraints()
    }
    
    // MARK: - Setup Views
    
    private func setupViews() {
        view.addSubview(calendarView)
        view.addSubview(userImageView)
        view.addSubview(userNameLabel)
        view.addSubview(addWorkoutButton)
    }
    
}

// MARK: - Set Constraints

extension MainViewController {
    
    private func setConstraints() {
        userImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.equalToSuperview().offset(sideIndents)
            make.width.height.equalTo(100)
        }
        
        userNameLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin).inset(sideIndents)
            make.trailing.equalToSuperview().inset(10)
            make.leading.equalTo(userImageView.snp.trailing).offset(5)
        }
        
        calendarView.snp.makeConstraints { make in
            make.top.equalTo(userImageView.snp.centerY)
            make.leading.trailing.equalToSuperview().inset(sideIndents)
            make.height.equalTo(70)
        }
        
        addWorkoutButton.snp.makeConstraints { make in
            make.top.equalTo(calendarView.snp.bottom
            ).offset(5)
            make.leading.equalToSuperview().inset(sideIndents)
            make.width.height.equalTo(80)
        }
    }
    
}
