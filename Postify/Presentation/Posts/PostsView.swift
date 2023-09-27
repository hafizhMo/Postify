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
    List(viewModel.posts.data) { post in
      Text(post.text)
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
