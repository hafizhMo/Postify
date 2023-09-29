//
//  PostDetailROuter.swift
//  Postify
//
//  Created by Hafizh Mo on 29/09/23.
//

import SwiftUI

final class PostDetailsRouter {
  
  public static func destinationForTappedPostDetails(user: UserPreview) -> some View {
    return UserDetailsConfigurator.configureUserDetailsView(with: user)
  }
}
