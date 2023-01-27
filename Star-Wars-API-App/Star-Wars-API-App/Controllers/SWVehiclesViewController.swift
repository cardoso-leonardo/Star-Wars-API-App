//
//  SWVehiclesViewController.swift
//  Star-Wars-API-App
//
//  Created by Leonardo Cardoso on 24/01/23.
//

import UIKit

final class SWVehiclesViewController: UIViewController {

    private let table = UITableView()
    private var vehicleViewModels = [SWVehicleViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Vehicle"
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
        table.register(SWVehicleCell.self, forCellReuseIdentifier: "cell")
    }
    
}

extension SWVehiclesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vehicleViewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell") as! SWVehicleCell
        cell.vehicleViewModel = vehicleViewModels[indexPath.row]
        return cell
    }
}
