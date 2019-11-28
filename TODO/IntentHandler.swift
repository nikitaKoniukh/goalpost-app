//
//  IntentHandler.swift
//  TODO
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Intents

class IntentHandler: INExtension {

    override func handler(for intent: INIntent) -> Any {
                guard intent is TODOIntent else {
                    fatalError("Unhandled Intent error : \(intent)")
                }
        return ToDoIntentHandler()
    }

}
