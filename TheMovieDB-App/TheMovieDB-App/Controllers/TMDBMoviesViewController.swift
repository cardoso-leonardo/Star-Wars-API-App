//
//  TMDBMoviesViewController.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import UIKit

final class TMDBMoviesViewController: UIViewController {
    
//    private let movieView = TMDBMovieTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Movies"
        view.backgroundColor = .systemBackground
//        view.addSubview(movieView)
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
//            movieView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            movieView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//            movieView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            movieView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
}
