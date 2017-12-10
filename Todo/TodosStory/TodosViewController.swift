//
//  TodosViewController.swift
//  Todo
//
//  Created by Anton Sergeev on 08.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController {

  var todos: [Todo] = [Todo("Make a kind thing"), Todo("Make a good thing"), Todo("Make a bad thing")] {
    didSet {
      childViewControllers.flatMap { $0 as? ContentObjectRepresentable }
        .forEach { $0.representedObject = todos }
    }
  }

  @IBAction func addTodo(_ sender: Any) {
    performSegue(withIdentifier: "AddTodo", sender: sender)
  }

  @IBAction func saveTodo(_ segue: UIStoryboardSegue) {
    guard let source = segue.source as? ContentObjectRepresentable,
      let todo = source.representedObject as? Todo else {
      return
    }
    if let index = todos.index(where: { $0.id == todo.id })  {
      todos[index] = todo
    } else {
      todos.append(todo)
    }
  }

  @IBAction func cancelEditingTodo(_ segue: UIStoryboardSegue) {
    return
  }

  @objc func prepareForTodoList(_ segue: UIStoryboardSegue, sender: Any?) {
    guard let destination = segue.destination as? ContentObjectRepresentable else {
      return
    }
    destination.representedObject = todos
  }

  @objc func prepareForAddTodo(_ segue: UIStoryboardSegue, sender: Any?) {
    guard let destination = segue.destination as? ContentObjectRepresentable else {
      return
    }
    destination.representedObject = Todo()
  }

}

// MARK: - Preparable

extension TodosViewController {

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let identifier = segue.identifier else {
      return
    }
    let actionName = "prepareFor" + identifier + ":sender:"
    let action = Selector(actionName)
    if self.responds(to: action) {
      self.perform(action, with: segue, with: sender)
    }
  }

}
