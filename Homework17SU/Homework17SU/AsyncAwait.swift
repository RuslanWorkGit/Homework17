//
//  AsyncAwait.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 24.01.2025.
//

import Foundation

actor ActorStart {
    
    func actorButtonPressed() async throws -> String {
        
        var counter = 0
        while counter <= 150000 {
            counter += 1
            print("Acror iteration - \(counter)")
        }

        return "Actor logic is finished"
    }
}
