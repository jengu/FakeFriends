//
//  APIProvider.swift
//  RandomApp
//
//  Created by Ilyas Siraev on 21.09.16.
//  Copyright © 2016 On The Moon. All rights reserved.
//

import Foundation

final class APIProvider: API {
  
  //MARK: - Properties
  
  let network: Network
  
  //MARK: - Init
  
  init(network: Network) {
    self.network = network
  }
  
  //MARK: - API
  
  func getRandomFriends(success: (([Friend]) -> Void)?,
                        failure: ((Error) -> Void)?) {
    let friendRequest = RequestFabric.randomFriendsRequest()
    network.make(request: friendRequest, success: {
      (jsonDict: [String : AnyObject]) in
      
      guard let items = jsonDict["results"] as? [[String : AnyObject]] else {
        failure?(APIError.invalidResponse)
        return
      }
      
      let friends = items.flatMap() {
        Friend(JSON: $0)
      }
      
      success?(friends)
      
      }, failure: failure)
  }
  
}
