//
//  NSCustomPersistentContainer.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit
import CoreData


class NSCustomPersistentContainer: NSPersistentContainer {

      override open class func defaultDirectoryURL() -> URL {
          var storeURL = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.NikitaKoniukh.goalpost-app.TODO")
          storeURL = storeURL?.appendingPathComponent("YourApp.sqlite")
          return storeURL!
      }

}
