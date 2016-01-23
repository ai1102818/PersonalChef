//
//  UILabel_Extention.swift
//  Senior Project App
//
//  Created by Abdelrazek Tarek on 2/21/15.
//  Copyright (c) 2015 Abdelrazek Tarek. All rights reserved.
//

import Foundation

extension UILabel {
    func heightForView(text:String, font:UIFont, numLines:Int) -> CGFloat{

        self.numberOfLines = numLines
        self.lineBreakMode = NSLineBreakMode.ByWordWrapping
        self.font = font
        self.text = text
        
        self.sizeToFit()
    
        return self.frame.height
        
//        let maxHeight : CGFloat = 10000
//        let rect = label.attributedText?.boundingRectWithSize(CGSizeMake(label.frame.size.width, maxHeight),
//            options: .UsesLineFragmentOrigin, context: nil)
//        var frame = label.frame
//        frame.size.height = rect!.size.height
//        label.frame = frame
//        return label.frame.height
    }
    
    func setAttrText(text:String){
        
        // Check label has existing text
        if (self.attributedText!.length > 0) {
            
            // Extract attributes
            let attributes = self.attributedText!.attributesAtIndex(0, effectiveRange: nil)
            
            // Set new text with extracted attributes
            self.attributedText = NSAttributedString(string: text, attributes: attributes)
            
        }
        
    }

}