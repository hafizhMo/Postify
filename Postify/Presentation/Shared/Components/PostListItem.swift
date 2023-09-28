//
//  PostListItem.swift
//  Postify
//
//  Created by Hafizh Mo on 28/09/23.
//

import SwiftUI

struct PostListItem: View {
  let post: PostPreview
  var withDivider = true
  
  var body: some View {
    VStack {
      HStack(alignment: .top, spacing: 12) {
        AsyncImage(url: URL(string: post.owner.picture)) { image in
          image
            .resizable()
            .scaledToFit()
            .frame(width: 28, height: 28, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        } placeholder: {
          ProgressView()
            .frame(width: 28, height: 28, alignment: .center)
            .background(.gray.opacity(0.2))
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        }
        
        VStack(alignment: .leading, spacing: 8) {
          Text("\(post.owner.firstName) \(post.owner.lastName)")
            .bold()
            .padding(.top, 4)
          
          Text(post.text)
            .multilineTextAlignment(.leading)
          
          AsyncImage(url: URL(string: post.image)) { image in
            image
              .resizable()
              .scaledToFit()
              .background(.gray.opacity(0.2))
              .frame(maxWidth: .infinity, alignment: .center)
              .clipShape(RoundedRectangle(cornerRadius: 4))
              .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1))
          } placeholder: {
            ProgressView()
              .frame(maxWidth: .infinity, minHeight: 200, alignment: .center)
              .background(.gray.opacity(0.2))
              .clipShape(RoundedRectangle(cornerRadius: 4))
              .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1))
          }
          
          HStack(spacing: 0) {
            Image(systemName: "heart")
            Text(post.likes.description)
            Image(systemName: "square.and.arrow.up")
              .padding(.leading)
            Spacer()
            Text(post.publishDate.prefix(10))
              .foregroundColor(.secondary)
          }
          .padding(.top)
        }
      }
      .padding(.horizontal)
      if withDivider {
        Divider()
      }
    }
  }
}

struct PostListItem_Previews: PreviewProvider {
  static var previews: some View {
    PostListItem(post: PostPreview.fake())
  }
}
