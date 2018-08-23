//
//  ViewController.swift
//  CollapsibleTableView
//
//  Created by Nicholas Rogers on 8/23/18.
//  Copyright © 2018 Nicholas Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /// The main table view.
    var tableView: UITableView?
    /// The model this main table view will use to load its data.
    var tableViewModel = CollapsibleTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the table view
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height),
                                style: .plain)
        tableView?.dataSource = tableViewModel
        tableView?.delegate = tableViewModel
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
        // Be sure to register the CollapsibleTableViewHeader
        tableView?.register(CollapsibleTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "header_view")
        self.view.addSubview(tableView!)
        
        // Use the model's closure to define how updates to showing and hiding cells should be handled. This default implementation works fine.
        tableViewModel.reloadSection = { [weak self] (section) in
            self?.tableView?.beginUpdates()
            self?.tableView?.reloadSections([section], with: .fade)
            self?.tableView?.endUpdates()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

