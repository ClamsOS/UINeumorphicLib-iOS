//
//  UINeumorphicView.swift
//  Neumorphism
//
//  Created by Mehdi on 25/02/2020.
//  Copyright © 2020 fr.district42. All rights reserved.
//

import UIKit

@IBDesignable
class UINeumorphicView: UIView {
    //initWithFrame to init view from code
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    enum ShadowMode {
        case light, dark
    }
    var shadowSubIndex: UInt32 = 0
    
    func createSublayerViewOf(view: UIView) -> UIView {
        let shadowView = UIView()
        shadowView.clipsToBounds = true
        shadowView.layer.name = "shadowView"
        shadowView.frame = view.frame
        shadowView.layer.cornerRadius = view.layer.cornerRadius
        view.insertSubview(shadowView, belowSubview: view)
        
        return shadowView
    }
    
    func addShadowCALayer(to view: UIView, style: ShadowMode) {
        let newShadow = CALayer()

        newShadow.name = "shadow\(shadowSubIndex)"

        newShadow.frame = view.bounds
        newShadow.shadowColor = style == .light ? UIColor(hexString: "#FFF").cgColor : UIColor(hexString: "#000").cgColor
        newShadow.shadowRadius = 1
        newShadow.shadowOpacity = 1
        newShadow.shadowOffset = .zero
        newShadow.needsDisplayOnBoundsChange = true
        newShadow.cornerRadius = view.layer.cornerRadius
        
        view.layer.insertSublayer(newShadow, at: shadowSubIndex)
        shadowSubIndex += 1
    }
    
    //common func to init our view
    private func setupView() {
        
        let backgroundView = createSublayerViewOf(view: self)
        
        addShadowCALayer(to: backgroundView, style: .light)
        addShadowCALayer(to: backgroundView, style: .dark)
        
        self.backgroundColor = UIColor(hexString: "#E0E0E0")
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
}
