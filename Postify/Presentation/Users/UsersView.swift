//
//  UsersView.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

struct UsersView: View {
  @ObservedObject var viewModel: UsersViewModel
  
  var body: some View {
    NavigationView {
      List(viewModel.users.data) { user in
        NavigationLink(destination: UsersRouter.destinationForTappedUser(user: user)) {
          Text(user.firstName)
        }
      }.navigationTitle("Users")
    }.onAppear {
      viewModel.onAppear()
    }
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView(viewModel: UsersViewModel())
  }
}
