//
//  PostEndpoint.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

extension Endpoint {
  
  static func getPosts() -> Self {
    return Endpoint(path: "/post")
  }
  
  static func getPostsByUser(id: String) -> Self {
    return Endpoint(path: "/user/\(id)/post")
  }
  
  static func getPostsByTag(id: String) -> Self {
    return Endpoint(path: "/tag/\(id)/post")
  }
  
  static func getPost(id: String) -> Self {
    return Endpoint(path: "/post/\(id)")
  }
  
  static func createPost(with post: PostCreate) -> Self {
    return Endpoint(path: "/post/create")
  }
  
  static func updatePost(id: String) -> Self {
    return Endpoint(path: "/post/\(id)")
  }
  
  static func deletePost(id: String) -> Self {
    return Endpoint(path: "/post/\(id)")
  }
}
