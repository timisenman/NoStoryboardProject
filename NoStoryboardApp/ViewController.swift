//
//  ViewController.swift
//  NoStoryboardApp
//
//  Created by Tim Isenman on 5/25/19.
//  Copyright © 2019 Timothy Isenman. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Set basics for App
        self.navigationController?.navigationBar.isHidden = true
        self.view.backgroundColor = .white
        

        let width = view.frame.width
        let height = view.frame.height
        let centerX = self.view.frame.midX
        let centerY = self.view.frame.midY
        
        
        self.view.addSubview(gradientView)
        gradientView.frame = CGRect(x: 0, y: 0, width: width, height: height/2)
        gradientView.setGradient(colorOne: UIColor.blue, colorTwo: UIColor.orange)

        addButton(with: "Push", atX: centerX, atY: centerY, ofWidth: 100, ofHeight: 50)
    }
    
    let gradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    let bottonGradientView: UIView = {
        let view = UIView()
        return view
    }()
    
    func addButton(with title: String, atX x: CGFloat, atY y: CGFloat, ofWidth width: CGFloat, ofHeight height: CGFloat) {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = height/2
        button.layer.borderColor = UIColor.blue.cgColor
        button.layer.borderWidth = 1
        button.adjustsImageSizeForAccessibilityContentSizeCategory = false
        
        self.view.addSubview(button)
        button.snp.makeConstraints { (make) in
            make.height.equalTo(height)
            make.width.equalTo(width)
            make.centerX.equalTo(x)
            make.centerY.equalTo(y)
        }
        
        button.setGradient(colorOne: UIColor.orange, colorTwo: UIColor.blue)
        button.addTarget(self, action: #selector(pushToNextView), for: .touchUpInside)
    }
    
    @objc func pushToNextView(from sender: UIButton!) {
        let nextView = SecondViewController()
        navigationController?.pushViewController(nextView, animated: true)
    }
    
}

extension UIView {
    func setGradient(colorOne: UIColor, colorTwo: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0,1.0]
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}

