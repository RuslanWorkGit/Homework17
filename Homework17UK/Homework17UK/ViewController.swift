//
//  ViewController.swift
//  Homework17UK
//
//  Created by Ruslan Liulka on 24.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    private let lable: UILabel = {
        let lable = UILabel()
        lable.text = "Some text"
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    
    private let gcdButton: UIButton = {
        let button = UIButton()
        button.setTitle("GCD", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let actorButton: UIButton = {
        let button = UIButton()
        button.setTitle("Actor", for: .normal)
        button.tintColor = .white
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let gcdLogic = GcdLogic()
    private let actorInstance = ActorText()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(lable)
        view.addSubview(gcdButton)
        view.addSubview(actorButton)
        
        
        
        gcdButton.addTarget(self, action: #selector(gcpButtonAction), for: .touchUpInside)
        actorButton.addTarget(self, action: #selector(actorButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
           lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           lable.centerYAnchor.constraint(equalTo: view.centerYAnchor),
           
           gcdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           gcdButton.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 20),
           gcdButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
           gcdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
           
           actorButton.topAnchor.constraint(equalTo: gcdButton.bottomAnchor, constant: 20),
           actorButton.leadingAnchor.constraint(equalTo: gcdButton.leadingAnchor),
           actorButton.trailingAnchor.constraint(equalTo: gcdButton.trailingAnchor)
           
        ])
    }
    
    @objc func gcpButtonAction() {
        gcdLogic.gcdRun { [weak self] result in
            DispatchQueue.main.async {
                self?.lable.text = result
            }
        }
    }
    
    @objc func actorButtonAction() {

        //let actorInstance = ActorText()
        Task {
            await actorInstance.updateText("Actor logic in progress...")
            lable.text = await actorInstance.currentText()
            
            let result = try await actorInstance.run()
            
            await actorInstance.updateText(result)
            lable.text = await actorInstance.currentText()
        
        }
    }
}

