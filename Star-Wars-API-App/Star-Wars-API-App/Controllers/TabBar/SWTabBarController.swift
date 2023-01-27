//
//  SWTabBarController.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import UIKit

class SWTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
    
    private func setupTabBar() {
        
        let peopleVC = SWPeopleViewController()
        let vehiclesVC = SWVehicleViewController()
        let spaceshipsVC = SWStarshipViewController()
        let settingsVC = SWSettingsViewController()
        
        let peopleNav = UINavigationController(rootViewController: peopleVC)
        let vehiclesNav = UINavigationController(rootViewController: vehiclesVC)
        let spaceshipsNav = UINavigationController(rootViewController: spaceshipsVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        
        for nav in [peopleNav, vehiclesNav, spaceshipsNav, settingsNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        peopleNav.tabBarItem = UITabBarItem(title: "Characters", image: UIImage(systemName: "person"), tag: 0)
        vehiclesNav.tabBarItem = UITabBarItem(title: "Vehicles", image: UIImage(systemName: "car"), tag: 1)
        spaceshipsNav.tabBarItem = UITabBarItem(title: "Spaceships", image: UIImage(systemName: "airplane"), tag: 2)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        
        setViewControllers([peopleNav, vehiclesNav, spaceshipsNav, settingsNav], animated: true)
        
    }
    
}
