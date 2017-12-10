//
//  MenuViewController.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

  @IBAction func hideMenu(_ sender: Any) {
    performSegue(withIdentifier: "HideMenu", sender: self)
  }

}
