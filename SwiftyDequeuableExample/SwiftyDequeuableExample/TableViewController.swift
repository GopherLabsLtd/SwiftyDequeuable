//
//  ViewController.swift
//  SwiftyDequeuableExample
//
//  Created by Alex Nguyen on 2017-08-19.
//  Copyright © 2017 Gopher Labs LTD. All rights reserved.
//

import UIKit
import SwiftyDequeuable

class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cells with TableView
        tableView.registerNib(SimpleLabelCell.self)
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // If we cannot dequeue cell, a fatal error would be thrown.
        let cell = tableView.dequeueReusableCell(SimpleLabelCell.self, forIndexPath: indexPath)
        cell.label.text = "\(SimpleLabelCell.reuseIdentifier) # \(indexPath.row)"
        return cell
    }
}
