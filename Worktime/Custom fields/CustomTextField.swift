//
//  CustomTextField.swift
//  Worktime
//
//  Created by Kamil Gancarczyk on 12/04/2019.
//  Copyright © 2019 Kamil Gancarczyk. All rights reserved.
//

import Foundation
import UIKit

class CustomTextField : UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        customizeTextField()
    }
    
    private func customizeTextField() {
       // borderStyle = .bezel
        layer.cornerRadius = frame.size.height/2
        tintColor = UIColor.white
        textColor = UIColor.white
        
        
        font = UIFont(name: "HelveticaNeue-Light", size: 20)
        autocorrectionType = .no
        clipsToBounds = true
        
        let placeHolder = self.placeholder != nil ? self.placeholder! : ""
        let placeHolderFont = UIFont(name: "HelveticaNeue-Light", size: 20)!
        
        attributedPlaceholder = NSAttributedString(string: placeHolder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: placeHolderFont])
        
        let indentView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        leftView = indentView
        leftViewMode = .always
    }
    
}
