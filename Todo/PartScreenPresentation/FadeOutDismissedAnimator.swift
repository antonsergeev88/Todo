//
//  FadeOutDismissedAnimator.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class FadeOutDismissedAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let duration: TimeInterval = 0.13

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let presentedView = transitionContext.view(forKey: .from)!
    presentedView.transform = CGAffineTransform.identity
    presentedView.alpha = 1.0
    UIView.animate(withDuration: duration, animations: {
      presentedView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
      presentedView.alpha = 0.0
    }, completion: { complete in
      presentedView.removeFromSuperview()
      transitionContext.completeTransition(complete)
    })
  }
}
