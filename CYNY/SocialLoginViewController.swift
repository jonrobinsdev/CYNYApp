//
//  SocialLoginViewController.swift
//  CYNY
//
//  Created by Jonathan Robins on 4/23/16.
//  Copyright © 2016 cyny. All rights reserved.
//

import UIKit

class SocialLoginViewController: UIViewController {

    @IBOutlet var socialLoginButtonView: UIView!
    @IBOutlet var socialButtonsView: UIView!
    @IBOutlet var pageIndicator: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true);
    }
    
    @IBAction func SocialLoginButtonPressed(sender: AnyObject) {
        let originalPosition:CGPoint = CGPointMake(socialLoginButtonView.center.x, socialLoginButtonView.center.y);
        self.socialButtonsView.translatesAutoresizingMaskIntoConstraints = true
        
        CATransaction.begin()
        CATransaction.setCompletionBlock({
            //callback on animations
            self.socialButtonsView.center = originalPosition;
            self.socialLoginButtonView.center = (CGPoint: CGPointMake(self.socialLoginButtonView.center.x - 400, self.socialLoginButtonView.center.y))
            self.socialLoginButtonView.hidden = true
        })
        
        let slideLeftAnimation = CABasicAnimation(keyPath: "position")
        slideLeftAnimation.duration = 0.40
        slideLeftAnimation.fromValue = NSValue(CGPoint: originalPosition)
        let newPosition:CGPoint = CGPointMake(socialLoginButtonView.center.x - 400, socialLoginButtonView.center.y)
        slideLeftAnimation.toValue = NSValue(CGPoint: newPosition)
        socialLoginButtonView.layer.addAnimation(slideLeftAnimation, forKey: "position")
        
        let slideLeftButtonsAnimation = CABasicAnimation(keyPath: "position")
        slideLeftButtonsAnimation.duration = 0.40
        slideLeftButtonsAnimation.fromValue = NSValue(CGPoint: CGPointMake(socialButtonsView.center.x, socialButtonsView.center.y))
        slideLeftButtonsAnimation.toValue = NSValue(CGPoint: originalPosition)
        self.pageIndicator.currentPage = 1
        socialButtonsView.layer.addAnimation(slideLeftButtonsAnimation, forKey: "position")
        CATransaction.commit()
    }
    
    @IBAction func SkipButtonPressed(sender: AnyObject) {
    }
    
    @IBAction func goBackToSocialPage(segue:UIStoryboardSegue) {
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
