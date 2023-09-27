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
    VStack {
      Image(uiImage: viewModel.avatar)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: screenWidth * 0.2,
               height: screenWidth * 0.2,
               alignment: .center)
        .clipShape(Circle())
        .shadow(radius: 10)
        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
        .padding()
      
      HStack {
        Text(viewModel.user.firstName)
        Text(viewModel.user.lastName)
      }
      
      Spacer()
    }.onAppear {
      viewModel.onAppear()
    }
  }
}

struct UserDetailsView_Previews: PreviewProvider {
  static var previews: some View {
    UserDetailsView(viewModel: UserDetailsViewModel(userPreview: UserPreview.fake()))
  }
}
