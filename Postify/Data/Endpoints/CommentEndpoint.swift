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
  
  static func getCommentsByUser(id: String) -> Self {
    return Endpoint(path: "/user/\(id)/comment")
  }
  
  static func createComment(owner: String, post: String) -> Self {
    return Endpoint(path: "/comment/create")
  }
  
  static func deleteComment(id: String) -> Self {
    return Endpoint(path: "/comment/\(id)")
  }
}
