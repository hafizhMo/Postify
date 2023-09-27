//
//  CommentsServices.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

protocol CommentsServiceProtocol: AnyObject {
  var networker: NetworkerProtocol { get }
  
  func getCommentsByPost(id: String) -> AnyPublisher<Comments, Error>
  func getCommentsByUser(id: String) -> AnyPublisher<Comments, Error>
}

final class CommentsService: CommentsServiceProtocol {
  
  let networker: NetworkerProtocol
  
  init(networker: NetworkerProtocol = Networker()) {
    self.networker = networker
  }
  
  func getCommentsByPost(id: String) -> AnyPublisher<Comments, Error> {
    let endpoint = Endpoint.getCommentsByPost(id: id)
    return networker.get(type: Comments.self, url: endpoint.url, headers: endpoint.headers)
  }
  
  func getCommentsByUser(id: String) -> AnyPublisher<Comments, Error> {
    let endpoint = Endpoint.getCommentsByUser(id: id)
    return networker.get(type: Comments.self, url: endpoint.url, headers: endpoint.headers)
  }
}
