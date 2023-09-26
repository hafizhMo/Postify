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

struct Location: Codable {
  let street: String
  let city: String
  let state: String
  let country: String
  let timezone: String
}
