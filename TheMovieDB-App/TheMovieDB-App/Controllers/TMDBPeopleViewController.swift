//
//  TMDBPeopleViewController.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import UIKit

final class TMDBPeopleViewController: UIViewController {
    
    private let peopleListView = TMDBPeopleListView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Actors"
        view.backgroundColor = .systemBackground
        view.addSubview(peopleListView)
        peopleListView.delegate = self
        
        addConstraints()
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            peopleListView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            peopleListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            peopleListView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            peopleListView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
}

extension TMDBPeopleViewController: TMDBPeopleListViewDelegate {
    func tmdbPeopleListView(_ peopleListView: TMDBPeopleListView, didSelect person: Person) {
        let viewModel = TMDBPeopleDetailViewViewModel(person: person)
        let detailVC = TMDBPeopleDetailViewController(viewModel: viewModel)
        detailVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

