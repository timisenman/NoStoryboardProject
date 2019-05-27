//
//  SecondViewController.swift
//  NoStoryboardApp
//
//  Created by Tim Isenman on 5/27/19.
//  Copyright © 2019 Timothy Isenman. All rights reserved.
//

import UIKit
import SnapKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white

        self.view.addSubview(gradientView)
        self.view.addSubview(dismissButton)
        
        dismissButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
        
        let height = self.view.bounds.height
        let width = self.view.bounds.width
        let midY = self.view.bounds.midY
        gradientView.frame = CGRect(x: 0, y: midY, width: width, height: height/2)
        gradientView.setGradient(colorOne: UIColor.orange, colorTwo: UIColor.blue)
        
    }
    
    let dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("Pop", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        
        return button
    }()
    
    @objc func dismissView() {
        navigationController?.popViewController(animated: true)
    }
    
    let gradientView: UIView = {
        let view = UIView()
        return view
    }()
    
}

