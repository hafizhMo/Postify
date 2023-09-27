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
  
  private var commentsService: CommentsServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(post: PostPreview, commentsService: CommentsServiceProtocol = CommentsService()) {
    self.post = post
    self.commentsService = commentsService
  }
  
  public func onAppear() {
    getComments()
  }
  
  private func getComments() {
    commentsService.getCommentsByPost(id: post.id)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { comments in
        self.comments = comments
      }
      .store(in: &cancellables)
  }
}
