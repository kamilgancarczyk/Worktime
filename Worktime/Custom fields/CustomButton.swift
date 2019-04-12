//
//  LoginButton.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 12/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import Foundation
import UIKit

class CustomButton : UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeButton()
    }
    
    private func customizeButton() {
        
        setTitleColor(UIColor.white, for: .normal)
        //        backgroundColor = UIColor(red: 0/255.0, green: 153.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        layer.cornerRadius = frame.size.height/2
    }
    
    
}
