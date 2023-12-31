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
  
  static func getPosts(count: Int, page: Int) -> Self {
    return Endpoint(path: "/post", queryItems: [
      URLQueryItem(name: "limit", value: "\(count)"),
      URLQueryItem(name: "page", value: "\(page)")
    ])
  }
  
  static func getPostsByUser(id: String, count: Int = 10, page: Int = 1) -> Self {
    return Endpoint(path: "/user/\(id)/post", queryItems: [
      URLQueryItem(name: "limit", value: "\(count)"),
      URLQueryItem(name: "page", value: "\(page)")
    ])
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
