//
//  PostDetailsViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

class PostDetailsViewModel: ObservableObject {
  @Published public var comments: Comments = Comments(data: [])
  public let post: PostPreview
  
  init(post: PostPreview) {
    self.post = post
  }
}
