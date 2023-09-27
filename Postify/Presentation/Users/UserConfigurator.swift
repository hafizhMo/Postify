//
//  UserConfigurator.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

final class UsersConfigurator {
  
  public static func configureUsersView(with viewModel: UsersViewModel = UsersViewModel()) -> UsersView {
    
    let usersView = UsersView(viewModel: viewModel)
    return usersView
  }
}
