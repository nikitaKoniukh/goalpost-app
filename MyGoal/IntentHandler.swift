//
//  IntentHandler.swift
//  MyGoal
//
//  Created by Nikita Koniukh on 27/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import Intents

class IntentHandler: INExtension {

    override func handler(for intent: INIntent) -> Any {
                guard intent is NewGoalIntent else {
                    fatalError("Unhandled Intent error : \(intent)")
                }
        return MyGoalIntentHandler()
    }
}
