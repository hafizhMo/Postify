//
//  UserDetailsViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

class UserDetailsViewModel: ObservableObject {
  @Published public var segmented = "Post"
  @Published public var user: UserFull = UserFull.fake()
  @Published public var posts: Posts = Posts(data: [])
  @Published public var comments: Comments = Comments(data: [])
  public let userPreview: UserPreview
  public let segmentedItem = ["Post", "Comment"]
  
  private var usersService: UsersServiceProtocol
  private var postsService: PostsServiceProtocol
  private var commentsService: CommentsServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(userPreview: UserPreview, usersService: UsersServiceProtocol = UsersService(), postsService: PostsServiceProtocol = PostsService(), commentsService: CommentsServiceProtocol = CommentsService()) {
    self.userPreview = userPreview
    self.usersService = usersService
    self.postsService = postsService
    self.commentsService = commentsService
  }
  
  public func onAppear() {
    getUserDetail()
    getPosts()
    getComments()
  }
  
  private func getUserDetail() {
    usersService.getUser(id: userPreview.id)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] user in
        self?.user = user
      }
      .store(in: &cancellables)
  }
  
  private func getPosts() {
    postsService.getPostByUser(id: userPreview.id)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] posts in
        self?.posts = posts
      }
      .store(in: &cancellables)
  }
  
  private func getComments() {
    commentsService.getCommentsByUser(id: userPreview.id)
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
