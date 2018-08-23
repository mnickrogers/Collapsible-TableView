//
//  ViewController.swift
//  CollapsibleTableView
//
//  Created by Nicholas Rogers on 8/23/18.
//  Copyright © 2018 Nicholas Rogers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var tableView: UITableView?
    var tableViewModel = CollapsibleTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height),
                                style: .plain)
        tableView?.dataSource = tableViewModel
        tableView?.delegate = tableViewModel
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: "cell_id")
        tableView?.register(CollapsibleTableViewHeaderView.self, forHeaderFooterViewReuseIdentifier: "header_view")
        tableView?.reloadData()
        self.view.addSubview(tableView!)
        
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

