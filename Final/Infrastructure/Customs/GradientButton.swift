//
//  GradientButton.swift
//  Final
//
//  Created by Mariami on 7/24/21.
//

import UIKit

class GradientButton: LocalizedButton {

    private var gradientLayer = CAGradientLayer()

    override func draw(_ rect: CGRect) {
        self.gradientLayer.colors = [
            UIColor(named: "buttonBG")!.cgColor,
            UIColor(named: "buttonBG2")!.cgColor
        ]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        gradientLayer.cornerRadius = 15
        gradientLayer.frame = self.layer.bounds

        self.layer.addSublayer(gradientLayer)
    }
        

 
}
