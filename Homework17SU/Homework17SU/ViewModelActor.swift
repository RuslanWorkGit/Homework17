//
//  ViewModelActor.swift
//  Homework17SU
//
//  Created by Ruslan Liulka on 24.01.2025.
//

import Foundation

@MainActor
class ViewModelActor: ObservableObject {
    
    @Published var data: String = "Actor logic in progress..."
    @Published var errorMessage: String?
    
    private let actorStarter = ActorStart()
    
    func start() async {
        do {
            let finishText = try await actorStarter.actorButtonPressed()
            self.data = finishText
        } catch {
            self.errorMessage = "Fail to do task with actor"
        }
    }
}
