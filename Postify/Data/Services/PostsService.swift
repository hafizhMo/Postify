//
//  PostsService.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

protocol PostsServiceProtocol: AnyObject {
  var networker: NetworkerProtocol { get }
  
  func getPosts() -> AnyPublisher<Posts, Error>
  func getPosts(count: Int) -> AnyPublisher<Posts, Error>
  func getPost(id: String) -> AnyPublisher<Post, Error>
}

final class PostsService: PostsServiceProtocol {
  
  let networker: NetworkerProtocol
  
  init(networker: NetworkerProtocol = Networker()) {
    self.networker = networker
  }
  
  func getPosts() -> AnyPublisher<Posts, Error> {
    let endpoint = Endpoint.getPosts()
    return networker.get(type: Posts.self, url: endpoint.url, headers: endpoint.headers)
  }
  
  func getPost(id: String) -> AnyPublisher<Post, Error> {
    let endpoint = Endpoint.getPost(id: id)
    return networker.get(type: Post.self, url: endpoint.url, headers: endpoint.headers)
  }
  
  func getPosts(count: Int) -> AnyPublisher<Posts, Error> {
    let endpoint = Endpoint.getPosts(count: count, page: 1)
    return networker.get(type: Posts.self, url: endpoint.url, headers: endpoint.headers)
  }
}
