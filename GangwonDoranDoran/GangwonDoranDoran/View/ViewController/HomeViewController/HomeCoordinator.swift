//
//  HomeCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit

class HomeCoordinator:Coordinator {
    var navigationController: UINavigationController?
    
    var children = [Coordinator]()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    
    func start() {
        print("HomeViewController pushed to navigationController")
        let homeViewController = HomeViewController()
        homeViewController.coordinator = self
        navigationController?.viewControllers = [homeViewController]
    }
}
