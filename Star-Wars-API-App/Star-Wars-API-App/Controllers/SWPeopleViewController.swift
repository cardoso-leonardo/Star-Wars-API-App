//
//  ViewController.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 20/01/23.
//

import UIKit

class SWPeopleViewController: UIViewController {
 
    private let table = UITableView()
    private var peopleViewModels = [SWPeopleViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Characters"
        view.backgroundColor = .systemBackground
        setupSubviews()
        setupTableViewConstraints()
        setupTable()
        
        SWService.shared.fetchPeopleData { people in
            self.peopleViewModels = people.map({return SWPeopleViewModel(people: $0)})
            DispatchQueue.main.async {
                self.table.reloadData()
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
        table.register(SWStarshipCell.self, forCellReuseIdentifier: "cell")
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

