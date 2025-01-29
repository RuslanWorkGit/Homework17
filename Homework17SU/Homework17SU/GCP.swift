//
//  GCP.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 24.01.2025.
//

import Foundation

class gcpClass {
    static func gcpStart(completion: @escaping (String) -> ()) {
        
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐶 - User Interactive, iteration - \(counter)")
            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐸 - User Initiated, iteration - \(counter)")
            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .utility).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐒 - Utility, iteration - \(counter)")
            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .background).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐳 - Background, iteration - \(counter)")
            }
            group.leave()
        }
     
        
        group.notify(queue: DispatchQueue.main) {
            completion("Done task")
        }
        
    }
}
