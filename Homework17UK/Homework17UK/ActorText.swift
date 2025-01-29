//
//  ActorText.swift
//  Homework17UK
//
//  Created by Ruslan Liulka on 25.01.2025.
//

import Foundation


actor ActorText {
    private var textLable = ""
    
    func run() async throws -> String {
        var counter = 0
        
        while counter <= 15000 {
            counter += 1
            print("Actor is working, counter: \(counter)")
        }
        
        return "Actor logic is finished"
    }
    
    func currentText() -> String {
        textLable
    }
    
    func updateText(_ newText: String) -> String {
        textLable = newText
        return textLable
    }
}
