//
//  Todo.swift
//  Todo
//
//  Created by Anton Sergeev on 08.12.2017.
//  Copyright © 2017 Anton Sergeev. All rights reserved.
//

import Foundation

struct Todo: Titled {
  let id: UUID
  var title: String?

  init() {
    id = UUID()
  }

  init(_ title: String) {
    self.init()
    self.title = title
  }
}
