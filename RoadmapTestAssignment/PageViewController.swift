//
//  PageViewController.swift
//  RoadmapTestAssignment
//
//  Created by Дмитрий Супрун on 23.08.22.
//

import UIKit

class PageViewController: UIPageViewController {
    
    var vc1: ViewController!
    var vc2: ViewController!
    var vc3: ViewController!
    var vc4: ViewController!
    
    init(data: DataModel) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        self.vc1 = ViewController(data: data.item[0])
        self.vc2 = ViewController(data: data.item[1])
        self.vc3 = ViewController(data: data.item[2])
        self.vc4 = ViewController(data: data.item[3])
        setViewControllers([vc1!], direction: .forward, animated: true)
        view.backgroundColor = .black
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    lazy var rocketsInfoViewControllers: [UIViewController] = {
        var viewController = [ViewController]()
        viewController = [vc1, vc2, vc3, vc4]
        return viewController
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
        
    }
}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ViewController else { return nil }
        if let index = rocketsInfoViewControllers.firstIndex(of: viewController) {
            if index > 0 {
                return rocketsInfoViewControllers[index - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? ViewController else { return nil }
        if let index = rocketsInfoViewControllers.firstIndex(of: viewController) {
            if index < rocketsInfoViewControllers.count - 1 {
                return rocketsInfoViewControllers[index + 1]
            }
        }
        return nil
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        4
    }
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        0
    }
    
}
