//
//  CommentListItem.swift
//  Postify
//
//  Created by Hafizh Mo on 28/09/23.
//

import SwiftUI

struct CommentListItem: View {
  let comment: Comment
  var withDivider = false
  var body: some View {
    VStack {
      Divider()
      HStack(alignment: .top, spacing: 12) {
        AsyncImage(url: URL(string: comment.owner.picture)) { image in
          image
            .resizable()
            .scaledToFit()
            .frame(width: 28, height: 28, alignment: .center)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 1))
        } placeholder: {
          ProgressView()
            .frame(width: 28, height: 28, alignment: .center)
        }
        
        VStack(alignment: .leading, spacing: 8) {
          HStack(spacing: 0) {
            Text("\(comment.owner.firstName) \(comment.owner.lastName)")
              .bold()
            Text("  • " + comment.publishDate.prefix(10))
              .foregroundColor(.secondary)
            Spacer()
          }
          .padding(.top, 4)
          
          Text(comment.message)
            .multilineTextAlignment(.leading)
          
        }
      }
      .padding(.horizontal)
      if withDivider {
        Divider()
      }
    }
  }
}

struct CommentListItem_Previews: PreviewProvider {
  static var previews: some View {
    CommentListItem(comment: Comment.fake())
  }
}
