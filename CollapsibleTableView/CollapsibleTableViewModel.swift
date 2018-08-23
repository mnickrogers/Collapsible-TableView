//
//  CollapsibleTableViewModel.swift
//  StockTrack
//
//  Created by Nicholas Rogers on 8/22/18.
//  Copyright © 2018 Nicholas Rogers. All rights reserved.
//

import UIKit

/// A model for representing data in a collapsible table view.
class CollapsibleTableViewModel: NSObject
{
    var reloadSection: ((_ section: Int) -> Void)?
    var sectionRowData = [Int : [Any]]()
    
    private var collapsedSections = [Int : Bool]()
    
    override init()
    {
        super.init()
    }
}

extension CollapsibleTableViewModel: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if let isCollapsed = collapsedSections[section], isCollapsed
        {
            return 0
        }
        return sectionRowData[section]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return sectionRowData.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header_view") as? CollapsibleTableViewHeaderView
            else { return UIView() }
        
        header.isCollapsed = collapsedSections[section] ?? false
        header.backgroundView?.backgroundColor = UIColor.red
        header.section = section
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_id", for: indexPath)
        cell.textLabel?.text = "Texty text text"
        return cell
    }
}

extension CollapsibleTableViewModel: UITableViewDelegate {}

extension CollapsibleTableViewModel: CollapsibleHeaderViewDelegate
{
    func headerView(_ headerView: CollapsibleTableViewHeaderView, selectedSection: Int)
    {
        headerView.isCollapsed = !headerView.isCollapsed
        collapsedSections[selectedSection] = headerView.isCollapsed
        
        reloadSection?(selectedSection)
    }
}
