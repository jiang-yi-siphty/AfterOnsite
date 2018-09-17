//
//  ViewController.swift
//  HelloUber
//
//  Copyright © 2017 Uber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var startButton = UIButton()
    public var targetLabel = UILabel()
    public var targetLabelText: String = "" {
        didSet {
            targetLabel.text = targetLabelText
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)

        //startButton
        startButton.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitle("Segue to OtherViewController", for: .normal)
        startButton.setTitleColor(#colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1), for: .normal)
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        view.addSubview(startButton)
        startButton.addTarget(self, action: #selector(startButtonTouchUpInside), for: .touchUpInside)
        startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0.0).isActive = true
        startButton.widthAnchor.constraint(equalToConstant: 300).isActive = true
        startButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        //targetLabel
        targetLabel.backgroundColor = UIColor.lightGray
        targetLabel.textColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        targetLabel.text = "Init Text"
        targetLabel.textAlignment = .center
        view.addSubview(targetLabel)
        targetLabel.translatesAutoresizingMaskIntoConstraints = false
        targetLabel.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 100).isActive = true
        targetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        targetLabel.leadingAnchor.constraint(equalTo: startButton.leadingAnchor, constant: 50).isActive = true
        targetLabel.trailingAnchor.constraint(equalTo: startButton.trailingAnchor, constant: -50).isActive = true
        targetLabel.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }

    override func viewDidAppear(_ animated: Bool) {
        print("Where is my startButton? \n (\(startButton.frame)")
        print("Where is my targetLabel? \n (\(targetLabel.frame)")
    }

    @objc private func startButtonTouchUpInside() {
        print("startButtonTouchUpInside")
        let nextVC = OtherViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

