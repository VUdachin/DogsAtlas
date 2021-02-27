//
//  PopOverTableViewController.swift
//  DogsAtlas
//
//  Created by Vladimir Udachin on 26.02.2021.
//

import UIKit

class PopOverViewController: UIViewController {

    var data = [String]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        setupTableView()
    }

    private func setupTableView() {
        view.addSubview(tableView)
        view.backgroundColor = .white
        
        
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.dataSource = self
        tableView.delegate = self
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
    
}
    
    
    extension PopOverViewController: UITableViewDataSource, UITableViewDelegate {
        func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            // #warning Incomplete implementation, return the number of rows
            return data.count
        }

        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PopOverCell.reuseIdentifier, for: indexPath) as? PopOverCell else {
                fatalError("Could not init PopCell")
            }
            let content = data[indexPath.row]
            cell.configure(with: content)
            return cell
        }
        

        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //
        }
}
    
    


