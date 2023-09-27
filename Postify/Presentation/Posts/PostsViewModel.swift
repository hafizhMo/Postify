//
//  PostsViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

class PostsViewModel: ObservableObject {
  @Published public var posts: Posts = Posts(data: [])
  
  private var postsService: PostsServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(postsService: PostsServiceProtocol = PostsService()) {
    self.postsService = postsService
  }
  
  public func onAppear() {
    self.getPosts(count: 20)
  }
  
  private func getPosts(count: Int) {
    postsService.getPosts(count: count)
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
  
}
