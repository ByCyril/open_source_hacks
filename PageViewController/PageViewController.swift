//
//  PageViewController.swoft
//
//  Created by Cyril Garcia on 8/16/18.
//  Copyright © 2018 Cyril Garcia. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
 
    var orderedViewController = [UIViewController]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.orderedViewController = [vc("FirstViewController"), vc("SecondViewController")]
        
        self.dataSource = self
        
        if let firstViewController = orderedViewController.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
        
    }

    func vc(_ identifier: String) -> UIViewController {
        return self.storyboard!.instantiateViewController(withIdentifier:identifier)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        let vcIndex = orderedViewController.index(of: viewController)!
        let lastIndex = vcIndex - 1
        
        guard lastIndex >= 0 else {
            return orderedViewController.last
        }
        
        guard orderedViewController.count > lastIndex else {
            return nil
        }
        
        return orderedViewController[lastIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
    
        
        let vcIndex = orderedViewController.index(of: viewController)!
        let nextIndex = vcIndex + 1
        
        
        guard orderedViewController.count != nextIndex else {
            return orderedViewController.first
        }
        
        guard orderedViewController.count > nextIndex else {
            return nil
        }
        
        return orderedViewController[nextIndex]
    }
    



}
