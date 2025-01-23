//
//  ContentView.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 23.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var text = "Text"
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
