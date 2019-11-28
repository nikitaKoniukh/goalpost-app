//
//  SharedUserDefaults.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Foundation

struct SharedUserDefaults {
    static let suitname = "group.com.NikitaKoniukh.goalpost-app.TODO"

    struct Keys {
        static let title = "title"
        static let term = "term"
        static let points = "points"
        static let goalsCount = "goalsCount"
    }
}
