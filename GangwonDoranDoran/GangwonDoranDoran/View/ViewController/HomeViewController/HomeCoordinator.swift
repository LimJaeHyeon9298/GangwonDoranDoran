//
//  HomeCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit

class HomeCoordinator:Coordinator {
    let apiClient: APIServiceProtocol
    let viewModel: HomeViewModel
    
    var navigationController: UINavigationController?
    
    var children = [Coordinator]()
    
    
    init(navigationController: UINavigationController) {
        self.apiClient = APIClient()
        self.viewModel = HomeViewModel(apiService: apiClient)
        self.navigationController = navigationController
    }

    
    
    func start() {
        print("HomeViewController pushed to navigationController")
        let homeViewController = HomeViewController(viewModel: viewModel)
        homeViewController.coordinator = self
        navigationController?.viewControllers = [homeViewController]
    }
}
