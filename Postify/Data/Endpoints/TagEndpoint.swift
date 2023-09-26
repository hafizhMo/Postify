//
//  TagEndpoint.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

extension Endpoint {
  
  static func getTags() -> Self {
    return Endpoint(path: "/tag")
  }
}
