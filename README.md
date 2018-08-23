# Collapsible-TableView
An implementation of a data model allowing a UITableView to be collapsed by its headers.

The collapsible table view model (CollapsibleTableViewModel.swift file) contains a type of table view model that allows users to expand or collapse the rows of a table view beneath their headers by tapping on the header. This model is UITableView-class agnostic, so you can use it with any UITableView or UITableView subclass.

When adding the model to the table view (an example of which is located in the ViewController), be sure to implement the closure ```reloadSection: ((_ section: Int) -> Void)?``` to tell the model how the table view (and which table view) gets updated in your controller. Here's an example from the ViewController:

```
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
```
Note: Be sure to use a weak reference to the table view's super view in the reloadSection and subsequent closures to avoid a retain cycle since the model object is a property of the super view.
