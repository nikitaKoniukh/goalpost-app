//
//  MyGoalIntentHandler.swift
//  MyGoal
//
//  Created by Nikita Koniukh on 27/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit
import Intents

let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suitname)

class MyGoalIntentHandler : NSObject, NewGoalIntentHandling {
    func handle(intent: NewGoalIntent, completion: @escaping (NewGoalIntentResponse) -> Void) {
        switch intent.term {
        case .longTerm:
            sharedUserDefaults?.set("Long Term", forKey: SharedUserDefaults.Keys.term)
        case .shortTerm:
            sharedUserDefaults?.set("Short Term", forKey: SharedUserDefaults.Keys.term)
        default:
            sharedUserDefaults?.set("", forKey: SharedUserDefaults.Keys.term)
        }

        sharedUserDefaults?.set(intent.title!, forKey: SharedUserDefaults.Keys.title)
        sharedUserDefaults?.set(intent.points, forKey: SharedUserDefaults.Keys.points)

        let goalsCount = sharedUserDefaults?.integer(forKey: SharedUserDefaults.Keys.goalsCount)

        completion(NewGoalIntentResponse.success(numberOfGoals: String((goalsCount ?? 0) + 1) ))
    }

    func resolveTitle(for intent: NewGoalIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let title = intent.title else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: title))
    }

    func resolveTerm(for intent: NewGoalIntent, with completion: @escaping (TermResolutionResult) -> Void) {
        if intent.term == .unknown {
          completion(TermResolutionResult.needsValue())
        } else {
          completion(TermResolutionResult.success(with: intent.term))
        }
    }

    func resolvePoints(for intent: NewGoalIntent, with completion: @escaping (NewGoalPointsResolutionResult) -> Void) {
        guard let points = intent.points else {
            completion(NewGoalPointsResolutionResult.needsValue())
            return
        }
        completion(NewGoalPointsResolutionResult.success(with: Int(truncating: points)))
    }
}
