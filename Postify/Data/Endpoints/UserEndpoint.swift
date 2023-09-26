//
//  UserEndpoint.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

extension Endpoint {
  
  static var getUsers: Self {
    return Endpoint(path: "/user")
  }
  
  static func getUsers(count: Int, page: Int) -> Self {
    return Endpoint(path: "/user", queryItems: [
      URLQueryItem(name: "limit", value: "\(count)"),
      URLQueryItem(name: "page", value: "\(page)")
    ])
  }
  
  static func getUserById(id: String) -> Self {
    return Endpoint(path: "/user/\(id)")
  }
  
  // POST
  static func createUser(firstName: String, lastName: String, email: String) -> Self {
    return Endpoint(path: "/user/create")
  }
  
  // PUT
  static func updateUser(id: String) -> Self {
    return Endpoint(path: "/user/\(id)")
  }
  
  // DELETE
  static func deleteUser(id: String) -> Self {
    return Endpoint(path: "/user/\(id)")
  }
}
