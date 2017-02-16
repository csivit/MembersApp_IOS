//
//  PageViewController.swift
//  TouchID
//
//  Created by Udit Pandoh on 31/01/17.
//  Copyright © 2017 Udit Pandoh. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController
{
    @IBOutlet weak var menuButton: UIBarButtonItem!
    var pageHeaders = ["NodeJs Workshop", "Ios Programming", "Develop Animation", "CodeSpace"]
    var pageImages = ["app4", "app4", "app4", "app4"]
    var pageDescriptions = ["Learn the most powerful backend platform ", "Learn the basics of Ios app development", "Delight your users with stunning animation and transition", "Connect people together!"]
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // this class is the page view controller's data source itself
        self.dataSource = self
        
        //  create the first walkthrough vc
        if let startWalkthroughVC = self.viewControllerAtIndex(0) {
            setViewControllers([startWalkthroughVC], direction: .forward, animated: true, completion: nil)
        }
        
        //view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.insertSubview(UIView(), at: 0)
    }
    
    // MARK: - Navigate
    
    func nextPageWithIndex(_ index: Int)
    {
        if let nextWalkthroughVC = self.viewControllerAtIndex(index+1) {
            setViewControllers([nextWalkthroughVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func viewControllerAtIndex(_ index: Int) -> WalkthroughViewController?
    {
        if index == NSNotFound || index < 0 || index >= self.pageDescriptions.count {
            return nil
        }
        
        // create a new walkthrough view controller and assing appropriate date
        if let walkthroughViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughViewController") as? WalkthroughViewController {
            walkthroughViewController.imageName = pageImages[index]
            walkthroughViewController.headerText = pageHeaders[index]
            walkthroughViewController.descriptionText = pageDescriptions[index]
            walkthroughViewController.index = index
            
            if forecasts.isEmpty == false
            {
                walkthroughViewController.imageName = pageImages[index]
                walkthroughViewController.headerText = forecasts[index]._name
                walkthroughViewController.descriptionText = forecasts[index]._short_desc
                walkthroughViewController.index = index
            }
            
            return walkthroughViewController
        }
        
        return nil
    }
}

extension PageViewController : UIPageViewControllerDataSource
{
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
    {
        var index = (viewController as! WalkthroughViewController).index
        index += 1
        return self.viewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! WalkthroughViewController).index
        index -= 1
        return self.viewControllerAtIndex(index)
    }
}






















