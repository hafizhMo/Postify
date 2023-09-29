//
//  PostDetailsViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI
import Combine

class PostDetailsViewModel: ObservableObject {
  @Published public var comments: Comments = Comments(data: [])
  @Published public var post: PostPreview
  
  private var postsService: PostsServiceProtocol
  private var commentsService: CommentsServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(post: PostPreview = PostPreview.fake(), id: String? = nil, commentsService: CommentsServiceProtocol = CommentsService(), postsService: PostsServiceProtocol = PostsService()) {
    self.post = post
    self.commentsService = commentsService
    self.postsService = postsService
    if let id = id {
      self.getPosts(id: id)
    }
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
  
  private func getPosts(id: String) {
    postsService.getPost(id: id)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] post in
        self?.post = post
      }
      .store(in: &cancellables)
  }
}
