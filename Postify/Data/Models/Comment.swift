//
//  Comment.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

struct Comments: Codable {
  let data: [Comment]
}

struct Comment: Codable, Identifiable {
  let id: String
  let message: String
  let owner: UserPreview
  let post: String
  let publishDate: String
}

extension Comment {
  public static func fake() -> Self {
    return Comment(id: "12323", message: "This looks amazing 🙌", owner: UserPreview.fake(), post: "123123", publishDate: "22/09/21")
  }
}

struct CommentCreate {
  let message: String
  let owner: String // User Id
  let post: String // Post Id
}
