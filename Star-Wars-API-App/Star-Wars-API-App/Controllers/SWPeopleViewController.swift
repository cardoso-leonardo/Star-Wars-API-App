//
//  ViewController.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import UIKit

final class SWPeopleViewController: UIViewController {
 
    private let table = UITableView()
    private var peopleViewModels = [SWPeopleViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        setupSubviews()
        setupTableViewConstraints()
        setupTable()
        
        
        SWService.shared.fetch(.listPeopleRequest, expecting: PeopleList.self) { result in
            switch result {
            case .success(let model):
                print(String(describing: model))
            case .failure(let error):
                print(String(describing: error))
            }
        }
        
    }
    
    private func setupSubviews() {
        view.addSubview(table)
    }
    
    private func setupTableViewConstraints() {
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    private func setupTable() {
        table.delegate = self
        table.dataSource = self
        table.register(SWPeopleCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension SWPeopleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peopleViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! SWPeopleCell
        cell.peopleViewModel = peopleViewModels[indexPath.row]
        return cell
    }

}

