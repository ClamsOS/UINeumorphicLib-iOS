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
    /// Select 2 Color Light and dark.
    /// Create a mid-tone by copying the dark element and change the L(Light) value of about 10% to 25%.
    /// HSL stands for Hue Saturation light
    /// Select color shade manually by between light and dark colors shown below.
    /// Eg: Convert Hex #A1AFC3 to HSL(215, 22%, 70%);
    let lightColor: UIColor = UIColor(hexString: "#FFF")
    let darkColor: UIColor = UIColor(hexString: "#A3B1C6")
    let midToneColor: UIColor = UIColor(hexString: "E0E5EC")
    
    //common func to init our view
    private func setupView() {
        self.backgroundColor = midToneColor
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        
        
        self.addShadow(offset: CGSize(width: 3, height: 3), color: darkColor, radius: 3.0, opacity: 1.0)
        //self.addShadow(offset: CGSize(width: -3, height: -3), color: lightColor, radius: 3.0, opacity: 0.3)

//        let lightView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
//        let darkView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
//        
//        darkView.addShadow(offset: CGSize(width: 3, height: 3), color: darkColor, radius: 3.0, opacity: 1.0)
//        lightView.addShadow(offset: CGSize(width: -3, height: -3), color: lightColor, radius: 3.0, opacity: 0.3)
//        
//        self.addSubview(lightView)
//        self.addSubview(darkView)
    }
}
