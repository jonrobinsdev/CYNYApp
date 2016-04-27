//
//  CoordinatesInputViewController.swift
//  CYNY
//
//  Created by Jonathan Robins on 4/25/16.
//  Copyright © 2016 cyny. All rights reserved.
//

import UIKit

class CoordinatesInputViewController: UIViewController {
    
    private let infoView = CoordinatesInfoNib.instanceFromNib()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        self.infoView.frame = CGRectMake(25, self.view.center.y+600, self.view.layer.frame.width-50, self.view.layer.frame.height-50)
        self.view.addSubview(self.infoView)
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(true)
        self.infoView.removeFromSuperview()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func infoButtonPressed(sender: AnyObject) {
        let originalPosition:CGPoint = CGPointMake(self.view.center.x, self.view.center.y+600);
        let newPosition:CGPoint = CGPointMake(self.view.center.x, self.view.center.y)

        let slideUpAnimation = CABasicAnimation(keyPath: "position")
        slideUpAnimation.duration = 0.40
        slideUpAnimation.fromValue = NSValue(CGPoint: originalPosition)
        slideUpAnimation.toValue = NSValue(CGPoint: newPosition)
        infoView.center = newPosition
        infoView.layer.addAnimation(slideUpAnimation, forKey: "position")
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
