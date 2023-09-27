//
//  PostifyApp.swift
//  Postify
//
//  Created by Hafizh Mo on 21/09/23.
//

import SwiftUI

@main
struct PostifyApp: App {
  var body: some Scene {
    WindowGroup {
      TabView {
        PostsConfigurator.configurePostsView()
          .tabItem {
            Label("Browse", systemImage: "globe")
          }
        
        UsersConfigurator.configureUsersView()
          .tabItem {
            Label("Users", systemImage: "person.3")
          }
        
      }
    }
  }
}
