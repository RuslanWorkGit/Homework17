//
//  ViewController.swift
//  Homework17UK
//
//  Created by Ruslan Liulka on 24.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
//    private let lable: UILabel = {
//        let lable = UILabel()
//        lable.text = "Some text"
//        lable.textAlignment = .center
//        lable.translatesAutoresizingMaskIntoConstraints = false
//        return lable
//    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lable = UILabel()
        lable.text = "Some text"
//        lable.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
//        lable.center = view.center
        lable.textAlignment = .center
        lable.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lable)
        
        let gcdButton = UIButton()
        gcdButton.setTitle("GCD", for: .normal)
//        gcpButton.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        gcdButton.tintColor = .white
        gcdButton.backgroundColor = .systemBlue
        gcdButton.layer.cornerRadius = 10
        gcdButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(gcdButton)
        
        gcdButton.addTarget(self, action: #selector(gcpButtonAction), for: .touchUpInside)
        
        let actorButton: UIButton = {
            let button = UIButton()
            button.setTitle("Actor", for: .normal)
            button.tintColor = .white
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 10
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        view.addSubview(actorButton)
        
        actorButton.addTarget(self, action: #selector(actorButtonAction), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
           lable.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           lable.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            gcdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gcdButton.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 20),
            gcdButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            gcdButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            actorButton.topAnchor.constraint(equalTo: gcdButton.bottomAnchor, constant: 20),
            actorButton.leadingAnchor.constraint(equalTo: gcdButton.leadingAnchor),
            actorButton.trailingAnchor.constraint(equalTo: gcdButton.trailingAnchor)
        ])
    }
    
    @objc func gcpButtonAction() {
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
            
//            self.lable.text = "Task DONE!!!!"
            
            if let lable = self.view.subviews.first(where: { $0 is UILabel }) as? UILabel {
                lable.text = "Task DONE!!!!"
            }
            
            
        }
        
        
    }
    
    @objc func actorButtonAction() {
        
    }
}

