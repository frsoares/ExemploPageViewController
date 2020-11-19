//
//  PageViewController.swift
//  ZineApp
//
//  Created by Francisco Soares Neto on 18/11/20.
//

import UIKit

class PageViewController: UIPageViewController {

    var views: [UIViewController] = []
    var index: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let board = UIStoryboard(name: "Main", bundle: nil)
        let blue = board.instantiateViewController(withIdentifier: "blue")
        let red = board.instantiateViewController(withIdentifier: "red")
        let green = board.instantiateViewController(identifier: "green")
        self.views = [blue, red, green]

        // Do any additional setup after loading the view.
        self.delegate = self
        self.dataSource = self
        
        self.setViewControllers([views[0]], direction: .forward, animated: true) { (completed) in
            if completed {
                print("OK!")
            } else {
                print("ERROR")
            }
        }
        
    }

}

extension PageViewController: UIPageViewControllerDelegate {
    
}

extension PageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController) else { return nil }
        if index > 0 {
            return views[index - 1]
        } else {
            return nil
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = views.firstIndex(of: viewController) else { return nil }
        if index >= views.count-1 {
            return nil
        } else {
            return views[index+1]
        }
        
    }

    func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .allButUpsideDown
    }

    func pageViewController(_ pageViewController: UIPageViewController, spineLocationFor orientation: UIInterfaceOrientation) -> UIPageViewController.SpineLocation {
        return UIPageViewController.SpineLocation.max
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return views.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return index
    }
    
}
