//
//  CollapsibleHeaderView.swift
//  StockTrack
//
//  Created by Nicholas Rogers on 8/22/18.
//  Copyright © 2018 Nicholas Rogers. All rights reserved.
//

import UIKit

protocol CollapsibleHeaderViewDelegate
{
    func headerView(_ headerView: CollapsibleTableViewHeaderView, selectedSection: Int)
}

class CollapsibleTableViewHeaderView: UITableViewHeaderFooterView
{
    var delegate: CollapsibleHeaderViewDelegate?
    var isCollapsed: Bool = false
    var section: Int = 0
    
    override init(reuseIdentifier: String?)
    {
        super.init(reuseIdentifier: reuseIdentifier)
        let view = UIView()
        view.addConstraints(self.constraints)
        backgroundView = view
        let recog = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.addGestureRecognizer(recog)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func viewTapped()
    {
        self.delegate?.headerView(self, selectedSection: section)
    }
}
