//
//  ContentObjectRepresentable.swift
//  Todo
//
//  Created by Anton Sergeev on 08.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import UIKit

@objc protocol ContentObjectRepresentable {
  var representedObject: Any? { get set }
}
