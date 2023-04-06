//
//  TMDBPeopleListViewViewModel.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import Foundation
import UIKit

protocol TMDBPeopleListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didLoadMorePeople(with newIndexPaths: [IndexPath])
    func didSelectPerson (_ person: Person)
}

final class TMDBPeopleListViewViewModel: NSObject {
    
    public weak var delegate: TMDBPeopleListViewViewModelDelegate?
    
    private var people: [Person] = [] {
        didSet {
            for person in people where !cellViewModels.contains(where: {$0.nameText == person.name}){
                guard let profilePath = person.profile_path else { return }
                let viewModel = TMDBPeopleCollectionViewCellViewModel(nameText: person.name, profilePath: profilePath)
                cellViewModels.append(viewModel)
            }
        }
    }
    
    private var currentPage: Int = 1
    
    private var totalPages: Int = 0
    
    private var cellViewModels: [TMDBPeopleCollectionViewCellViewModel] = []
    
    public func fetchPeople() {
        TMDBService.shared.fetch(.listPeopleRequest, expecting: TMDBPopularPersonList.self) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let model):
                strongSelf.people = model.results
                strongSelf.totalPages = model.total_pages
                strongSelf.currentPage = model.page + 1
                print(String(strongSelf.currentPage),String(strongSelf.totalPages))
                DispatchQueue.main.async {
                    strongSelf.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    public func fetchAdditionalPeople() {
        guard !isLoadingMore else { return }
        isLoadingMore = true
        print("Fetching more people")
        let queryItems = [URLQueryItem(name: "page", value: String(currentPage))]
        let request = TMDBRequest(endpoint: .person, queryParameters: queryItems)
        TMDBService.shared.fetch(request, expecting: TMDBPopularPersonList.self) { [weak self] result in
            guard let strongSelf = self else { return }
            switch result {
            case .success(let model):
                
                strongSelf.totalPages = model.total_pages
                strongSelf.currentPage = model.page + 1
                
                let originalCount = strongSelf.people.count
                let newCount = model.results.count
                let total = originalCount + newCount
                let startingIndex = total - newCount
                let indexPathsToAdd: [IndexPath] = Array(startingIndex..<(startingIndex+newCount)).compactMap {
                    return IndexPath(row: $0, section: 0)
                }
                
                
                strongSelf.people.append(contentsOf: model.results)
                print(String(strongSelf.cellViewModels.count))
                DispatchQueue.main.async {
                    strongSelf.delegate?.didLoadMorePeople(with: indexPathsToAdd)
                }
                strongSelf.isLoadingMore = false
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    
    private var shouldShowLoadMoreIndicator: Bool {
        return currentPage <= totalPages
    }
    
    private var isLoadingMore = false
}

//MARK: CollectionView
extension TMDBPeopleListViewViewModel: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TMDBPeopleCollectionViewCell.cellIdentifier, for: indexPath) as? TMDBPeopleCollectionViewCell else {
            fatalError("Unsupported Cell Type")
        }
        cell.configure(with: cellViewModels[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = UIScreen.main.bounds
        let width = (bounds.width - 30) / 2
        let height = width * 1.5
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let person = people[indexPath.row]
        delegate?.didSelectPerson(person)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard kind == UICollectionView.elementKindSectionFooter,
              let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TMDBFooterLoadingCollectionReusableView.identifier, for: indexPath) as? TMDBFooterLoadingCollectionReusableView else { fatalError("Unsupported") }
        footer.startAnimating()
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        guard shouldShowLoadMoreIndicator else { return .zero }
        return CGSize(width: collectionView.frame.width, height: 100)
    }
    
}

//MARK: ScrollView
extension TMDBPeopleListViewViewModel: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard shouldShowLoadMoreIndicator,
              !isLoadingMore,
              !cellViewModels.isEmpty
        else { return }
        
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false){ [weak self] t in
            let offset = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let frameHeight = scrollView.frame.size.height
            if offset >= (contentHeight-frameHeight-120) {
                self?.fetchAdditionalPeople()
            }
            t.invalidate()
        }
    }
}

