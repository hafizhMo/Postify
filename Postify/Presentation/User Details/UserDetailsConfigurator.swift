//
//  UserDetailsConfigurator.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

final class UserDetailsConfigurator {
  
  public static func configureUserDetailsView(with user: UserPreview) -> UserDetailsView {
    
    let userDetailsView = UserDetailsView(viewModel: UserDetailsViewModel(userPreview: user))
    return userDetailsView
  }
}
