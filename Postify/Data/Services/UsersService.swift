//
//  UsersService.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

protocol UsersServiceProtocol: AnyObject {
  var networker: NetworkerProtocol { get }
  
  func getUsers() -> AnyPublisher<Users, Error>
  func getUsers(count: Int) -> AnyPublisher<Users, Error>
  func getUser(id: String) -> AnyPublisher<UserFull, Error>
}

final class UsersService: UsersServiceProtocol {
  
  let networker: NetworkerProtocol
  
  init(networker: NetworkerProtocol = Networker()) {
    self.networker = networker
  }
  
  func getUsers() -> AnyPublisher<Users, Error> {
    let endpoint = Endpoint.getUsers
    return networker.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
  }
  
  func getUsers(count: Int) -> AnyPublisher<Users, Error> {
    let endpoint = Endpoint.getUsers(count: count, page: 1)
    return networker.get(type: Users.self, url: endpoint.url, headers: endpoint.headers)
  }
  
  func getUser(id: String) -> AnyPublisher<UserFull, Error> {
    let endpoint = Endpoint.getUserById(id: id)
    return networker.get(type: UserFull.self, url: endpoint.url, headers: endpoint.headers)
  }
}
