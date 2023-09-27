//
//  PostsRouter.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

final class PostsRouter {
  
  public static func destinationForTappedPost(post: PostPreview) -> some View {
    return PostDetailsConfigurator.configurePostDetailsView(with: post)
  }
}
