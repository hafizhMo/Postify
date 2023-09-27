//
//  PostsConfigurator.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

final class PostsConfigurator {
  
  public static func configurePostsView(with viewModel: PostsViewModel = PostsViewModel()) -> PostsView {
    
    let postsView = PostsView(viewModel: viewModel)
    return postsView
  }
}
