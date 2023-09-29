//
//  CommentEndpoint.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

extension Endpoint {
  
  static func getComments() -> Self {
    return Endpoint(path: "/comment")
  }
  
  static func getCommentsByPost(id: String) -> Self {
    return Endpoint(path: "/post/\(id)/comment")
  }
  
  static func getCommentsByUser(id: String, count: Int = 10, page: Int = 1) -> Self {
    return Endpoint(path: "/user/\(id)/comment", queryItems: [
      URLQueryItem(name: "limit", value: "\(count)"),
      URLQueryItem(name: "page", value: "\(page)")
    ])
  }
  
  static func createComment(with comment: CommentCreate) -> Self {
    return Endpoint(path: "/comment/create")
  }
  
  static func deleteComment(id: String) -> Self {
    return Endpoint(path: "/comment/\(id)")
  }
}
