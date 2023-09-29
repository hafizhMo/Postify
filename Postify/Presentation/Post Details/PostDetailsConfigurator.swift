//
//  PostDetailsConfigurator.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

final class PostDetailsConfigurator {
  public static func configurePostDetailsView(with post: PostPreview) -> PostDetailsView {
    
    let postDetailsView = PostDetailsView(viewModel: PostDetailsViewModel(post: post))
    return postDetailsView
  }
  
  public static func configurePostDetailsView(with id: String) -> PostDetailsView {
    
    let postDetailsView = PostDetailsView(viewModel: PostDetailsViewModel(id: id))
    return postDetailsView
  }
}
