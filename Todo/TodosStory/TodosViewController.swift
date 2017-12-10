//
//  TodosViewController.swift
//  Todo
//
//  Created by Anton Sergeev on 08.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class TodosViewController: UIViewController {

  var todos: [Todo] = [Todo("asdf"), Todo("qwerty"), Todo("zxcbasdf")]

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

  @IBAction func addTodo(_ sender: Any) {
    performSegue(withIdentifier: "AddTodoSegue", sender: sender)
  }

  @IBAction func saveTodo(_ segue: UIStoryboardSegue) {
    print("saveTodo")
  }

  @objc func prepareForTodoList(_ segue: UIStoryboardSegue, sender: Any?) {
    guard let destination = segue.destination as? ContentObjectRepresentable else {
      return
    }
    destination.representedObject = todos
  }

}
