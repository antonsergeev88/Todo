//
//  TodoDetailViewController.swift
//  Todo
//
//  Created by Anton Sergeev on 09.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

  var todo: Titled?

  @IBOutlet weak var titleField: UITextField!

  @IBAction func save(_ sender: Any) {
    performSegue(withIdentifier: "SaveTodo", sender: self)
  }

  @objc func prepareForSaveTodo(_ segue: UIStoryboardSegue, sender: Any?) {
    todo?.title = titleField.text
  }

}

// MARK: - ContentObjectRepresentable

extension TodoDetailViewController: ContentObjectRepresentable {
  var representedObject: Any? {
    get {
      return todo
    }
    set {
      todo = newValue as? Todo
    }
  }
}

// MARK: - Preparable

extension TodoDetailViewController {

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
