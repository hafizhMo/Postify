//
//  UserDetailsViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import UIKit
import Combine

class UserDetailsViewModel: ObservableObject {
  @Published public var avatar: UIImage = UIImage()
  @Published public var user: UserFull = UserFull.fake()
  public let userPreview: UserPreview
  
  private var usersService: UsersServiceProtocol
  private var pictureService: PictureServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(userPreview: UserPreview, usersService: UsersServiceProtocol = UsersService(), pictureService: PictureServiceProtocol = PictureService()) {
    self.userPreview = userPreview
    self.usersService = usersService
    self.pictureService = pictureService
  }
  
  public func onAppear() {
    getUserAvatar()
    getUserDetail()
  }
  
  private func getUserDetail() {
    usersService.getUser(id: userPreview.id)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] user in
        self?.user = user
      }
      .store(in: &cancellables)
  }
  
  private func getUserAvatar() {
    pictureService.getPictureData(urlString: userPreview.picture)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error): print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] data in
        guard let image = UIImage(data: data) else { return }
        self?.avatar = image
      }
      .store(in: &cancellables)
  }
}
