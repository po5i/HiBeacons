//
//  StepThree.swift
//  KwemaBeacons
//
//  Created by Carlos Villavicencio on 6/22/16.
//  Copyright © 2016 Nick Toumpelis. All rights reserved.
//

import UIKit

class StepThree : UIViewController {
    @IBAction func idDismissOnboarding(sender: UIButton) {
        print("dismiss!")
        //popViewControllerAnimated(true)
        dismissViewControllerAnimated(true, completion: {})
    }
    
}