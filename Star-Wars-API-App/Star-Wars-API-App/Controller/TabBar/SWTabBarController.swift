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
        let vehiclesVC = SWVehiclesViewController()
        let spaceshipsVC = SWSpaceshipsViewController()
        
        peopleVC.title = "People"
        vehiclesVC.title = "Vehicles"
        spaceshipsVC.title = "Spaceships"
        
        let peopleNav = UINavigationController(rootViewController: peopleVC)
        let vehiclesNav = UINavigationController(rootViewController: vehiclesVC)
        let spaceshipsNav = UINavigationController(rootViewController: spaceshipsVC)
        
        for nav in [peopleNav, vehiclesNav, spaceshipsNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        peopleNav.tabBarItem.title = "People"
        vehiclesNav.tabBarItem.title = "Vehicles"
        spaceshipsNav.tabBarItem.title = "Spaceships"
        
        setViewControllers([peopleNav, vehiclesNav, spaceshipsNav], animated: true)
        
    }
    
}
