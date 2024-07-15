//
//  ThirdCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit
import Combine


class ThirdCoordinator:Coordinator {
   
    var navigationController: UINavigationController?
    
    var children = [Coordinator]()
    
    private var cancellables = Set<AnyCancellable>()
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    
    
    
    func start() {
        print("LoginCoordinator: start called")
        
        let thirdViewController = ThirdViewController()
        thirdViewController.coordinator = self
        navigationController?.viewControllers = [thirdViewController]
    }
    
    
}

