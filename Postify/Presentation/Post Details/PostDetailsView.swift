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
    ScrollView {
      VStack {
        Text(viewModel.post.text)
          .bold()
          .font(.headline)
        Text(viewModel.post.publishDate)
          .font(.caption)
          .foregroundColor(.secondary)
        
        Text("Comments (\(viewModel.comments.data.count))")
          .bold()
          .font(.title3)
          .padding(.top)
        
        if viewModel.comments.data.count > 0 {
          ForEach(viewModel.comments.data) { comment in
            Text(comment.message)
          }
        } else {
          Text("No Comments")
            .font(.caption2)
            .foregroundColor(.secondary)
        }
      }
    }.onAppear {
      viewModel.onAppear()
    }
  }
}

struct PostDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    PostDetailsView(viewModel: PostDetailsViewModel(post: PostPreview.fake()))
  }
}
