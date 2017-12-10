//
//  PartScreenSegue.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class PartScreenSegue: UIStoryboardSegue {

  override func perform() {
    destination.modalPresentationStyle = .custom
    let transitioningDelegate = PartScreenPresentationController(presentedViewController: destination, presenting: source)
    destination.transitioningDelegate = transitioningDelegate
    source.present(destination, animated: true, completion: nil)
  }

}
