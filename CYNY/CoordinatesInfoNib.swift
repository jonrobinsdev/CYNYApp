//
//  CoordinatesInfoNib.swift
//  CYNY
//
//  Created by Jonathan Robins on 4/26/16.
//  Copyright © 2016 cyny. All rights reserved.
//

import UIKit

class CoordinatesInfoNib: UIView {
    
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "CoordinatesInfoNib", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }
    @IBAction func exitInfoView(sender: AnyObject) {
        let newPosition:CGPoint = CGPointMake(self.center.x, self.center.y+600);
        let originalPosition:CGPoint = CGPointMake(self.center.x, self.center.y)
        
        let slideDownAnimation = CABasicAnimation(keyPath: "position")
        slideDownAnimation.duration = 0.40
        slideDownAnimation.fromValue = NSValue(CGPoint: originalPosition)
        slideDownAnimation.toValue = NSValue(CGPoint: newPosition)
        self.center = newPosition
        self.layer.addAnimation(slideDownAnimation, forKey: "position")
    }
}
