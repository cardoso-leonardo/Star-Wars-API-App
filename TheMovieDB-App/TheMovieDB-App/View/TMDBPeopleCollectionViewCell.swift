//
//  TMDBPeopleCollectionViewCell.swift
//  TheMovieDB-App
//
//  Created by Leonardo Cardoso on 27/01/23.
//

import UIKit

final class TMDBPeopleCollectionViewCell: UICollectionViewCell {
 
    static let cellIdentifier = "TMDBPeopleCollectionViewCell"
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = false
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
        nameLabel.text = nil
    }
    
    public func configure(with viewModel: TMDBPeopleCollectionViewCellViewModel) {
        nameLabel.text = viewModel.nameText
        viewModel.fetchImage { result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    let image = UIImage(data: data)
                    self.imageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    
    
    //MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.addSubviews(nameLabel,imageView)
        contentView.layer.cornerRadius = 10
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Unsupported")
    }
    
    //MARK: Constraints
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
        
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            nameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor, constant: -5),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
            
        ])
        
    }
    
}
