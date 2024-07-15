//
//  HomeCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit

class HomeCoordinator:Coordinator {
  
    
    func showHome() {
        print("showHome called in HomeCoordinator")
    }
    
   
    var navigationController: UINavigationController?
    
    var children = [Coordinator]()
    
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    
    func start() {
        print("HomeViewController pushed")
        let homeViewController = HomeViewController()
                homeViewController.coordinator = self
                navigationController?.pushViewController(homeViewController, animated: true)
        print("HomeViewController pushed to navigationController")
    }
    
    
}
