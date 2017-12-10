//
//  PartScreenPresentationController.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class PartScreenPresentationController: UIPresentationController {

  let dimmingView = UIView()

  override var frameOfPresentedViewInContainerView: CGRect {
    let size = presentedViewController.preferredContentSize
    let x = (containerView!.frame.width - size.width) / 2.0
    let origin = CGPoint(x: x, y: 100.0)
    return CGRect(origin: origin, size: size)
  }

  override func presentationTransitionWillBegin() {
    let dimmingView = self.dimmingView
    dimmingView.backgroundColor = .white
    dimmingView.alpha = 0.0
    dimmingView.frame = presentingViewController.view.bounds
    containerView!.addSubview(dimmingView)
    let coordinator = presentingViewController.transitionCoordinator
    coordinator?.animate(alongsideTransition: { context in
      dimmingView.alpha = 0.8
    }, completion: nil)
  }

  override func dismissalTransitionWillBegin() {
    let dimmingView = self.dimmingView
    let coordinator = presentingViewController.transitionCoordinator
    coordinator?.animate(alongsideTransition: { context in
      dimmingView.alpha = 0.0
    }, completion: nil)
  }

  override func dismissalTransitionDidEnd(_ completed: Bool) {
    dimmingView.removeFromSuperview()
  }

}

extension PartScreenPresentationController: UIViewControllerTransitioningDelegate {

  func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
    return self
  }

  func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return FadeInPresentedAnimator()
  }

  func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
    return FadeOutDismissedAnimator()
  }
  
}
