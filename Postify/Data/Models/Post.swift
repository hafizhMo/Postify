//
//  Post.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

struct Posts: Codable {
  let data: [PostPreview]
}

struct PostPreview: Codable, Identifiable {
  let id: String
  let text: String
  let image: String
  let likes: Int
  let tags: [String]
  let publishDate: String
  let owner: UserPreview
}

struct Post: Codable, Identifiable {
  let id: String
  let text: String
  let image: String
  let likes: Int
  let link: String?
  let tags: [String]
  let publishDate: String
  let owner: UserPreview
}

struct PostCreate {
  let text: String
  let image: String
  let likes: Int
  let tags: [String]
  let owner: String // User Id
}
