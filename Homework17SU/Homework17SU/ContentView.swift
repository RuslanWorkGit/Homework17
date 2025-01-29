//
//  ContentView.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "Text"
    @StateObject private var actor = ViewModelActor()
    
    var body: some View {
        VStack {

            Text(text)
            Button("GCP") {
                gcpClass.gcpStart { result in
                    text = result
                }
                
            }
            .font(.title3)
            .foregroundColor(.white)
            .frame(width: 150, height: 50)
            .background(.blue)
            .cornerRadius(20)
            .padding(10)
            

            
            Button("Actor") {
                Task {
                    text = "Actor logic in progress..."
                    //let actor = ActorStart()
                    await actor.start()
                    if let error = actor.errorMessage {
                        text = error
                    } else {
                        text = actor.data
                    }
                }
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


    
}

#Preview {
    ContentView()
}
