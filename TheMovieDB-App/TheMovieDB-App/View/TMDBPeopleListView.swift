//
//  TMDBPeopleListView.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 26/01/23.
//

import UIKit

protocol TMDBPeopleListViewDelegate: AnyObject {
    func tmdbPeopleListView(_ peopleListView: TMDBPeopleListView, didSelect person: Person)
}

final class TMDBPeopleListView: UIView {
    
    private let viewModel = TMDBPeopleListViewViewModel()
    
    public weak var delegate: TMDBPeopleListViewDelegate?
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isHidden = true
        collectionView.alpha = 0
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionView.register(TMDBPeopleCollectionViewCell.self, forCellWithReuseIdentifier: TMDBPeopleCollectionViewCell.cellIdentifier)
        return collectionView
    }()
    
    private let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.hidesWhenStopped = true
        spinner.translatesAutoresizingMaskIntoConstraints = false
        return spinner
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubviews(collectionView, spinner)
        spinner.startAnimating()
        viewModel.delegate = self
        viewModel.fetchPeople()
        addConstraints()
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant: 100),
            spinner.heightAnchor.constraint(equalToConstant: 100),
            spinner.centerXAnchor.constraint(equalTo: centerXAnchor),
            spinner.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
    private func setupCollectionView() {
        collectionView.delegate = viewModel
        collectionView.dataSource = viewModel
    }
    
}

extension TMDBPeopleListView: TMDBPeopleListViewViewModelDelegate {
    func didSelectPerson(_ person: Person) {
        delegate?.tmdbPeopleListView(self, didSelect: person)
    }
    
    func didLoadInitialCharacters() {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
        UIView.animate(withDuration: 0.4) {
            self.collectionView.alpha = 1
        }
        viewModel.fetchAdditionalPeople()
        
    }
}
