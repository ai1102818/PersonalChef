//
//  UITextView_Extension.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 5/7/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//

import Foundation
extension UITextView{
    func setAttrText(text:String){
        
        // Check label has existing text
        if (self.attributedText != nil) {
            
            // Extract attributes
            var attributes = self.attributedText.attributesAtIndex(0, effectiveRange: nil)
            
            // Set new text with extracted attributes
            self.attributedText = NSAttributedString(string: text, attributes: attributes)
            
        }
        
    }
}