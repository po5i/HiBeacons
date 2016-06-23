//
//  OnboardingPager.swift
//  KwemaBeacons
//
//  Created by Carlos Villavicencio on 6/22/16.
//  Copyright © 2016 Nick Toumpelis. All rights reserved.
//

import UIKit

class OnboardingPager : UIPageViewController {
    func getStepZero() -> StepZero {
        return storyboard!.instantiateViewControllerWithIdentifier("StepZero") as! StepZero
    }
    
    func getStepOne() -> StepOne {
        return storyboard!.instantiateViewControllerWithIdentifier("StepOne") as! StepOne
    }
    
    func getStepTwo() -> StepTwo {
        return storyboard!.instantiateViewControllerWithIdentifier("StepTwo") as! StepTwo
    }
    
    func getStepThree() -> StepThree {
        return storyboard!.instantiateViewControllerWithIdentifier("StepThree") as! StepThree
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .darkGrayColor()
        dataSource = self
        setViewControllers([getStepZero()], direction: .Forward, animated: false, completion: nil)
    }
}

extension OnboardingPager : UIPageViewControllerDataSource {
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(StepThree) {
            return getStepTwo()
        } else if viewController.isKindOfClass(StepTwo) {
            return getStepOne()
        } else if viewController.isKindOfClass(StepOne) {
            return getStepZero()
        } else {
            print("begin??")
            return nil
        }
    }
    
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        if viewController.isKindOfClass(StepZero) {
            return getStepOne()
        } else if viewController.isKindOfClass(StepOne) {
            return getStepTwo()
        } else if viewController.isKindOfClass(StepTwo) {
            return getStepThree()
        } else {
            print("end??")
            return nil
        }
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 4
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    
    
}