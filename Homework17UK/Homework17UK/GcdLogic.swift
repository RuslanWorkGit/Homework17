//
//  gcdLogic.swift
//  Homework17UK
//
//  Created by Ruslan Liulka on 25.01.2025.
//


import Foundation


class GcdLogic {
    func gcdRun(comletion: @escaping (String) -> ()) {
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global(qos: .userInteractive).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐭 - user Interactive, iteration - \(counter)")

            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .userInitiated).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐷 - user Initiated, iteration - \(counter)")
            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .utility).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐥 - utility, iteration - \(counter)")

            }
            group.leave()
        }
        
        group.enter()
        DispatchQueue.global(qos: .background).async {
            var counter = 0
            while counter <= 10000 {
                counter += 1
                print("🐳 - background, iteration - \(counter)")

            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            print("✅ Всі завдання завершені")
            comletion("Task DONE!!!!")
            
//            if let lable = self.view.subviews.first(where: { $0 is UILabel }) as? UILabel {
//                lable.text = "Task DONE!!!!"
//            }
        }
    }
}
