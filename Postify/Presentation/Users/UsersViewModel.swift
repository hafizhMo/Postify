//
//  UsersViewModel.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
  @Published public var users: Users = Users(data: [])
  
  private var usersService: UsersServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(usersService: UsersServiceProtocol = UsersService()) {
    self.usersService = usersService
  }
  
  public func onAppear() {
    self.getUsers(count: 40)
  }
  
  private func getUsers(count: Int) {
    usersService.getUsers(count: count)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] users in
        self?.users = users
      }
      .store(in: &cancellables)
  }
}
