//
//  RoundTextField.swift
//  Crew-Chat
//
//  Created by Nikolai Brix Laursen on 17/03/2017.
//  Copyright © 2017 CrewNET IVS. All rights reserved.
//

import UIKit

@IBDesignable

class RoundTextField: UITextField {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var bgColor: UIColor? {
        didSet {
            backgroundColor = bgColor
        }
    }
    
    @IBInspectable var placeholderColor: UIColor? {
        didSet {
            let _ = attributedPlaceholder?.string != nil ? attributedPlaceholder!.string : ""
            let str = NSAttributedString(string: (attributedPlaceholder?.string)!, attributes: [NSForegroundColorAttributeName: placeholderColor!])
            attributedPlaceholder = str
            
        }
        
        
    }
}
