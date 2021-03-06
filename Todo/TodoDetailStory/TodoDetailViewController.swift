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

  override func viewDidLoad() {
    titleField.text = todo?.title
  }

  @IBAction func save(_ sender: Any) {
    performSegue(withIdentifier: "SaveTodo", sender: self)
  }

  @IBAction func cancel(_ sender: Any) {
    performSegue(withIdentifier: "CancelEditing", sender: self)
  }

  @objc func prepareForSaveTodo(_ segue: UIStoryboardSegue, sender: Any?) {
    todo?.title = titleField.text
  }

  @objc func prepareForCancelEditing(_ segue: UIStoryboardSegue, sender: Any?) {
    todo = nil
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
