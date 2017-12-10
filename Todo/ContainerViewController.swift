//
//  ContainerViewController.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

  @IBOutlet var contentView: UIView!

  var menuView: UIView?

  override func showDetailViewController(_ vc: UIViewController, sender: Any?) {
    guard self.menuView == nil else {
      return
    }
    let menuView = UIView()
    self.menuView = menuView
    var frame = contentView.frame
    frame.size.width -= 100.0
    menuView.frame = frame
    let menuTransform = CGAffineTransform(translationX: -frame.width, y: 0.0)
    let contentTransform = CGAffineTransform(translationX: frame.width, y: 0.0)
    vc.view.frame = menuView.bounds
    menuView.addSubview(vc.view)
    view.addSubview(menuView)
    view.bringSubview(toFront: contentView)
    menuView.transform = menuTransform
    UIView.animate(withDuration: 0.33, animations: {
      self.contentView.transform = contentTransform
      menuView.transform = CGAffineTransform.identity
    }, completion: nil)
  }

  @IBAction func hideMenu(_ segue: UIStoryboardSegue) {
    UIView.animate(withDuration: 0.33, animations: {
      self.contentView.transform = CGAffineTransform.identity
      self.menuView?.transform = CGAffineTransform(translationX: -self.menuView!.frame.width, y: 0.0)
    }, completion: { complene in
      self.menuView?.removeFromSuperview()
      self.menuView = nil
    })
  }

}
