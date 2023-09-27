//
//  UsersRouter.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

final class UsersRouter {
  
  public static func destinationForTappedUser(user: UserPreview) -> some View {
    return UserDetailsConfigurator.configureUserDetailsView(with: user)
  }
}
