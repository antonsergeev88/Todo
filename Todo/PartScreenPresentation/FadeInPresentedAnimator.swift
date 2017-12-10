//
//  FadeInPresentedAnimator.swift
//  TodoApp
//
//  Created by Anton Sergeev on 10.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

class FadeInPresentedAnimator: NSObject, UIViewControllerAnimatedTransitioning {

  let duration: TimeInterval = 0.33

  func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
    return duration
  }

  func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
    let containerView = transitionContext.containerView
    let presentedView = transitionContext.view(forKey: .to)!
    let finalFrame = transitionContext.finalFrame(for: transitionContext.viewController(forKey: .to)!)
    presentedView.frame = finalFrame
    containerView.addSubview(presentedView)
    presentedView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
    presentedView.alpha = 0.0
    UIView.animate(withDuration: duration, animations: {
      presentedView.transform = CGAffineTransform.identity
      presentedView.alpha = 1.0
    }, completion: { complete in
      transitionContext.completeTransition(complete)
    })
  }
}
