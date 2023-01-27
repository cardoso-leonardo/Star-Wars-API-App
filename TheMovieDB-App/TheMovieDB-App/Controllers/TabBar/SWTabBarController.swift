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
        
        let peopleVC = TMDBPeopleViewController()
        let moviesVC = TMDBMoviesViewController()
        let tvShowsVC = TMDBTVShowsViewController()
        let settingsVC = SWSettingsViewController()
        
        let peopleNav = UINavigationController(rootViewController: peopleVC)
        let moviesNav = UINavigationController(rootViewController: moviesVC)
        let tvShowsNav = UINavigationController(rootViewController: tvShowsVC)
        let settingsNav = UINavigationController(rootViewController: settingsVC)
        
        
        for nav in [peopleNav, moviesNav, tvShowsNav, settingsNav] {
            nav.navigationBar.prefersLargeTitles = true
        }
        
        peopleNav.tabBarItem = UITabBarItem(title: "Actors", image: UIImage(systemName: "person"), tag: 0)
        moviesNav.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "film"), tag: 1)
        tvShowsNav.tabBarItem = UITabBarItem(title: "TV Shows", image: UIImage(systemName: "tv"), tag: 2)
        settingsNav.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gear"), tag: 3)
        
        setViewControllers([peopleNav, moviesNav, tvShowsNav, settingsNav], animated: true)
        
    }
    
}
