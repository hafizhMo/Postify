//
//  User.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

struct Users: Codable {
  let data: [UserPreview]
}

struct UserPreview: Codable, Identifiable {
  let id: String
  let title: String
  let firstName: String
  let lastName: String
  let picture: String
}

extension UserPreview {
  static func fake() -> Self {
    return UserPreview(id: "1231", title: "Mrs.", firstName: "...", lastName: "...", picture: "https://via.placeholder.com/150x150")
  }
}

struct UserFull: Codable, Identifiable {
  let id: String
  let title: String
  let firstName: String
  let lastName: String
  let gender: String
  let email: String
  let dateOfBirth: String
  let registerDate: String
  let phone: String
  let picture: String
  let location: Location
}

extension UserFull {
  static func fake() -> Self {
    return UserFull(id: "12312", title: "Mrs.", firstName: "...", lastName: "...", gender: "Female", email: "wang.yiren@mail.com", dateOfBirth: "2000/12/12", registerDate: "", phone: "1231222", picture: "https://via.placeholder.com/150x150", location: Location.fake())
  }
}

struct Location: Codable {
  let street: String
  let city: String
  let state: String
  let country: String
  let timezone: String
}

extension Location {
  static func fake() -> Self {
    return Location(street: "1805 Royal Ln", city: "Dallas", state: "TX 75229", country: "United States", timezone: "")
  }
}
