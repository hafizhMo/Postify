//
//  PostsView.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

struct PostsView: View {
  @ObservedObject var viewModel: PostsViewModel
  
  var body: some View {
    NavigationView {
      ScrollView {
        VStack {
          ForEach(viewModel.posts.data) { post in
            NavigationLink(destination: PostsRouter.destinationForTappedPost(post: post)) {
              PostListItem(post: post)
                .foregroundColor(.primary)
            }
          }
        }
      }.navigationTitle("Posts")
    }.onAppear {
      viewModel.onAppear()
    }
  }
}

struct PostsView_Previews: PreviewProvider {
  static var previews: some View {
    PostsView(viewModel: PostsViewModel())
  }
}
