//
//  PostDetailsView.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

struct PostDetailsView: View {
  @ObservedObject var viewModel: PostDetailsViewModel
  
  var body: some View {
    VStack {
      Text(viewModel.post.text)
        .bold()
        .font(.headline)
      Text(viewModel.post.publishDate)
        .font(.caption)
        .foregroundColor(.secondary)
    }
  }
}

struct PostDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    PostDetailsView(viewModel: PostDetailsViewModel(post: PostPreview.fake()))
  }
}
