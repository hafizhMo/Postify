//
//  UserDetailsView.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import SwiftUI

struct UserDetailsView: View {
  @ObservedObject var viewModel: UserDetailsViewModel
  
  private let screenWidth = UIScreen.main.bounds.width
  
  var body: some View {
    ScrollView {
      VStack {
        AsyncImage(url: URL(string: viewModel.user.picture)) { image in
          image
            .resizable()
            .scaledToFit()
            .frame(width: screenWidth * 0.2, height: screenWidth * 0.2, alignment: .center)
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(Circle().stroke(Color.blue, lineWidth: 3))
            .padding()
        } placeholder: {
          ProgressView()
            .frame(width: screenWidth * 0.2, height: screenWidth * 0.2, alignment: .center)
        }
        
        HStack {
          Text(viewModel.user.firstName)
          Text(viewModel.user.lastName)
        }
        
        Picker("Activities", selection: $viewModel.segmented) {
          ForEach(viewModel.segmentedItem, id: \.self) {
            Text($0)
          }
        }
        .pickerStyle(.segmented)
        .padding()
        
        if viewModel.segmented == viewModel.segmentedItem.first! {
          postList
        } else {
          commentList
        }
        
        Spacer()
      }
    }
    .navigationBarTitleDisplayMode(.inline)
    .onAppear {
      viewModel.onAppear()
    }
  }
  
  private var postList: some View {
    VStack {
      if viewModel.posts.data.count > 0 {
        ForEach(viewModel.posts.data) { post in
          NavigationLink(destination: PostsRouter.destinationForTappedPost(post: post)) {
            PostListItem(post: post)
          }
        }
      } else {
        Text("No Posts")
          .font(.caption2)
          .foregroundColor(.secondary)
      }
    }
  }
  
  private var commentList: some View {
    VStack {
      if viewModel.comments.data.count > 0 {
        ForEach(Array(viewModel.comments.data.enumerated()), id: \.offset) { index, comment in
          CommentListItem(comment: comment, withDivider: index == viewModel.comments.data.count-1)
        }
      } else {
        Text("No Comments")
          .font(.caption2)
          .foregroundColor(.secondary)
      }
    }
  }
}

struct UserDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    UserDetailsView(viewModel: UserDetailsViewModel(userPreview: UserPreview.fake()))
  }
}
