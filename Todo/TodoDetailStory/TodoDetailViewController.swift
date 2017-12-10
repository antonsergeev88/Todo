//
//  TodoDetailViewController.swift
//  Todo
//
//  Created by Anton Sergeev on 09.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class TodoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  @IBAction func save(_ sender: Any) {
    performSegue(withIdentifier: "SaveTodoSegue", sender: self)
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    print("prepare for SaveTodoSegue")
  }
}
