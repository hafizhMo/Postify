//
//  PictureService.swift
//  Postify
//
//  Created by Hafizh Mo on 27/09/23.
//

import Foundation

import Combine

protocol PictureServiceProtocol: AnyObject {
  var networker: NetworkerProtocol { get }
  
  func getPictureData(urlString: String) -> AnyPublisher<Data, Error>
}

final class PictureService: PictureServiceProtocol {
  let networker: NetworkerProtocol
  
  init(networker: NetworkerProtocol = Networker()) {
    self.networker = networker
  }
  
  enum PictureError: Error {
    case dataInvalid
  }
  
  func getPictureData(urlString: String) -> AnyPublisher<Data, Error> {
    guard let url = URL(string: urlString) else {
      return Fail<Data, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }
    
    return networker.getData(url: url, headers: [:])
      .mapError { _ in PictureError.dataInvalid }
      .eraseToAnyPublisher()
  }
}
