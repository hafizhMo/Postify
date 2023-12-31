//
//  URLEndpoint.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

extension Endpoint {
  var url: URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "dummyapi.io"
    components.path = "/data/v1" + path
    components.queryItems = queryItems
    
    guard let url = components.url else {
      preconditionFailure("Invalid URL components: \(components)")
    }
    
    return url
  }
  
  var headers: [String: Any] {
    return [
      "app-id": "650a4e461865ac5c694a4582"
    ]
  }
}
