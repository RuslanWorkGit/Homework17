//
//  ContentView.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "Text"
    
    var body: some View {
        VStack {

            Text(text)
            Button("GCP") {
                gcpStart()
            }
            .font(.title3)
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(.blue)
            .cornerRadius(20)
            .padding(10)
            

            
            Button("Actor") {
                
            }
            .font(.title3)
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(.blue)
            .cornerRadius(20)
            .padding(10)

        }
        .padding()
    }
    
    func gcpStart() {
        
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
            text = "Done task"
        }
        
    }
}

#Preview {
    ContentView()
}
