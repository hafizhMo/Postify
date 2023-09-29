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
        
        detail
        
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
  
  private var detail: some View {
    VStack {
      Text(viewModel.user.gender)
        .font(.caption)
        .padding(.vertical, 4)
        .padding(.horizontal, 8)
        .background(.blue)
        .cornerRadius(4)
      
      Text(viewModel.userPreview.firstName + " " + viewModel.userPreview.lastName)
        .foregroundColor(.white)
        .font(.headline)
        .bold()
      
      Text(viewModel.user.email)
        .foregroundColor(.secondary)
        .padding(.bottom)
      
      HStack {
        HStack(spacing: 0) {
          Image(systemName: "calendar")
          Text(viewModel.user.dateOfBirth.prefix(10))
            .font(.body)
        }
        .padding()
        .foregroundColor(.gray)
        .background(.gray.opacity(0.2))
        .cornerRadius(4)
        
        HStack(spacing: 0) {
          Image(systemName: "phone")
          Text(viewModel.user.phone)
            .font(.body)
        }
        .padding()
        .foregroundColor(.gray)
        .background(.gray.opacity(0.2))
        .cornerRadius(4)
      }
      .padding(.horizontal)
    }
  }
  
  private var postList: some View {
    VStack {
      if viewModel.posts.data.count > 0 {
        ForEach(viewModel.posts.data) { post in
          NavigationLink(destination: UserDetailsRouter.destinationForTappedPost(post: post)) {
            PostListItem(post: post)
              .foregroundColor(.primary)
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
          NavigationLink(destination: UserDetailsRouter.destinationForTappedPost(id: comment.post)) {
            CommentListItem(comment: comment, withDivider: index == viewModel.comments.data.count-1)
              .foregroundColor(.primary)
          }
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
