//
//  SWSpaceshipsViewController.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import UIKit

final class SWSpaceshipsViewController: UIViewController {

    private let table = UITableView()
    private var starshipViewModels = [SWStarshipViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Spaceships"
        view.backgroundColor = .systemBackground
        setupSubviews()
        setupTableViewConstraints()
        setupTable()
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

extension SWSpaceshipsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starshipViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! SWStarshipCell
        cell.starshipViewModel = starshipViewModels[indexPath.row]
        return cell
    }
}
