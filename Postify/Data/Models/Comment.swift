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

struct CommentCreate {
  let message: String
  let owner: String // User Id
  let post: String // Post Id
}
