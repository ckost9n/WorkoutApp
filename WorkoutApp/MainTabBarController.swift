//
//  ViewController.swift
//  WorkoutApp
//
//  Created by Konstantin on 14.06.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
//        setTabBarAppearance()
        setupTabBar()
    }

    private func generateTabBar() {
        viewControllers = [
            generateVC(vc: MainViewController(), title: "Main", image: UIImage(named: "tabBarMain")),
            generateVC(vc: StatisticViewController(), title: "Statistic", image: UIImage(named: "tabBarStatistic")),
            generateVC(vc: ProfileViewController(), title: "Profile", image: UIImage(named: "tabBarProfile"))
        ]
    }
    
    private func setTabBarAppearance() {
        let positionOnX: CGFloat = 10
        let positionOnY: CGFloat = 14
        let width = tabBar.bounds.width - positionOnX * 2
        let height = tabBar.bounds.height + positionOnY * 2
        
        let roundLayer = CAShapeLayer()
        
        let bezierPath = UIBezierPath(
            roundedRect: CGRect(
                x: positionOnX,
                y: tabBar.bounds.minY - positionOnY,
                width: width,
                height: height
            ),
            cornerRadius: height / 2
        )
        
        roundLayer.path = bezierPath.cgPath
        
        tabBar.layer.insertSublayer(roundLayer, at: 0)
        
        tabBar.itemWidth = width / 5
        tabBar.itemPositioning = .centered
        
        roundLayer.fillColor = UIColor.specialTabBar.cgColor

        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray

    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func generateVC(vc: UIViewController, title: String, image: UIImage?) -> UIViewController {
        vc.tabBarItem.title = title
        vc.tabBarItem.image = image
        return vc
    }
    
}

