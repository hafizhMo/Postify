//
//  UserDetailsRouter.swift
//  Postify
//
//  Created by Hafizh Mo on 29/09/23.
//

import SwiftUI

final class UserDetailsRouter {
  
  public static func destinationForTappedPost(post: PostPreview) -> some View {
    return PostDetailsConfigurator.configurePostDetailsView(with: post)
  }
}
