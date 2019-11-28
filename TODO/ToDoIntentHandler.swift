//
//  ToDoIntentHandler.swift
//  goalpost-app
//
//  Created by Nikita Koniukh on 25/11/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit
import Intents
import CoreData


let sharedUserDefaults = UserDefaults(suiteName: SharedUserDefaults.suitname)

class ToDoIntentHandler : NSObject, TODOIntentHandling {

    func resolveTerm(for intent: TODOIntent, with completion: @escaping (TermResolutionResult) -> Void) {
         if intent.term == .unknown {
                   completion(TermResolutionResult.needsValue())
               } else {
                   completion(TermResolutionResult.success(with: intent.term))
               }
    }

    func resolvePoints(for intent: TODOIntent, with completion: @escaping (TODOPointsResolutionResult) -> Void) {
        guard let points = intent.points else {
            completion(TODOPointsResolutionResult.needsValue())
            return
        }
        completion(TODOPointsResolutionResult.success(with: Int(truncating: points)))
    }

    func resolveTitle(for intent: TODOIntent, with completion: @escaping (INStringResolutionResult) -> Void) {
        guard let title = intent.title else {
            completion(INStringResolutionResult.needsValue())
            return
        }
        completion(INStringResolutionResult.success(with: title))
    }

    

    func handle(intent: TODOIntent, completion: @escaping (TODOIntentResponse) -> Void) {

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

        completion(TODOIntentResponse.success(numberOfGoals: String((goalsCount ?? 0) + 1) ))
    }

    //implement this method to get the to-do list from UserDefaults, add to it, save it again to user defaults
    //and return its size
    func addTODO(title: String, term: String, points: Int) -> Int{
        return 1
    }
}
