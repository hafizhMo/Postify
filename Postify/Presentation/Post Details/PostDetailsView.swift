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
        PostListItem(post: viewModel.post)
        
        Text("Comments (\(viewModel.comments.data.count))")
          .bold()
          .font(.title3)
          .padding(.top)
        
        if viewModel.comments.data.count > 0 {
          ForEach(Array(viewModel.comments.data.enumerated()), id: \.offset) { index, comment in
            CommentListItem(comment: comment, withDivider: index == viewModel.comments.data.count-1)
          }
        } else {
          Text("No Comments")
            .font(.caption2)
            .foregroundColor(.secondary)
        }
        
        Spacer()
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      viewModel.onAppear()
    }
  }
}

struct PostDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    PostDetailsView(viewModel: PostDetailsViewModel(post: PostPreview.fake()))
  }
}
