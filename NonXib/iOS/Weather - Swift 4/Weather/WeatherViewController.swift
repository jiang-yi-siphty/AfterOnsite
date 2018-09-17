//
//  WeatherViewController.swift
//  Weather
//
//  Created by Yi JIANG on 17/9/18.
//  Copyright © 2018 Uber. All rights reserved.
//

import Foundation
import UIKit

class WeatherViewController: UIViewController {
    var city: City?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = UIButton()
        backButton.setTitle("Back", for: .normal)
        backButton.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        backButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        view.addSubview(backButton)
        if #available(iOS 11.0, *) {
            backButton.translatesAutoresizingMaskIntoConstraints = false
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
            backButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
            backButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        } else {
            backButton.frame = CGRect(x: 10, y: 10, width: view.bounds.width - 20, height: 44)
        }
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
    
    @objc func dismissView(){
        dismissView()
    }
}
