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
    if let identifier = segue.identifier, identifier == "TodoListSegue" {
      guard let destination = segue.destination as? ContentObjectRepresentable else {
        return
      }
      destination.representedObject = todos
    }
  }

  @IBAction func addTodo(_ sender: Any) {
    performSegue(withIdentifier: "AddTodoSegue", sender: sender)
  }

  @IBAction func addNewTodo(_ segue: UIStoryboardSegue) {
    print("asdf")
  }

}
