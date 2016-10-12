//
//  RealmGateway.swift
//  RandomApp
//
//  Created by Ilyas Siraev on 27.09.16.
//  Copyright © 2016 Jengu. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmGateway {
  
  //MARK: - Properties
  
  var defaultRealm: Realm { get }
  var getWriteRealm: () -> Realm { get }
  
  //MARK: - Init
  
  init(realm: Realm, getWriteRealm: @escaping () -> Realm)
  
  //MARK: - Methods
  
  func save<T: Object>(_ object: T, completion: (() -> Void)?) where T: ThreadSaveable
  func save<T: Object>(_ objects: [T], completion: (() -> Void)?) where T: ThreadSaveable
  
}
