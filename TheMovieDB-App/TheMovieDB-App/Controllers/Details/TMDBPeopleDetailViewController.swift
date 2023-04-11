//
//  TMDBPeopleDetailViewController.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 01/02/23.
//

import UIKit

final class TMDBPeopleDetailViewController: UIViewController {
    
    private let viewModel: TMDBPeopleDetailViewViewModel
    
    private let detailView = TMDBPeopleDetailView()
    
    init(viewModel: TMDBPeopleDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        view.addSubview(detailView)
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(didTapShare))
        addConstraints()
    }
    
    @objc
    private func didTapShare() {
        //Share actor info
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        ])
    }
    
}
