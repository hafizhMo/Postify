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

extension PostPreview {
  public static func fake() -> Self {
    return PostPreview(id: "123", text: "Lorem ipsum dolor", image: "", likes: 20, tags: ["public", "else"], publishDate: "", owner: UserPreview.fake())
  }
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
