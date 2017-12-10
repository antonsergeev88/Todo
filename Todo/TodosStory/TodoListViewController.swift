//
//  TodoListViewController.swift
//  Todo
//
//  Created by Anton Sergeev on 08.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

  var todos: [Titled] = [] {
    didSet {
      tableView.reloadData()
    }
  }

  // MARK: - Table view data source

  override func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
    let row = indexPath.row
    let todo = todos[row]
    let title = todo.title
    cell.textLabel?.text = title
    return cell
  }

}

// MARK: - ContentObjectRepresentable

extension TodoListViewController: ContentObjectRepresentable {
  var representedObject: Any? {
    get {
      return todos
    }
    set {
      todos = newValue is [Titled] ? newValue as! [Titled] : todos
    }
  }
}
