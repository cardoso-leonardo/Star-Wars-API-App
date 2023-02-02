//
//  TMDBPeopleDetailViewController.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 01/02/23.
//

import UIKit

final class TMDBPeopleDetailViewController: UIViewController {
    
    private let viewModel: TMDBPeopleDetailViewViewModel
    
    init(viewModel: TMDBPeopleDetailViewViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = viewModel.title
    }
    
}
