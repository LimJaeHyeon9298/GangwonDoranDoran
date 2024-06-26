//
//  AppCordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/25/24.
//

import UIKit
import Combine


protocol Coordinator {
    var navigationController: UINavigationController? {get set}
    func start()
}

class AppCoordinator:Coordinator {
    var navigationController: UINavigationController?
    private var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        showLogin()
    }

    func showLogin() {
        let loginViewModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        loginViewController.coordinator = self
        navigationController?.setViewControllers([loginViewController], animated: true)
        
        loginViewModel.navigationHomePublisher
            .sink { [weak self] in
                self?.showHome()
            }
            .store(in: &cancellables)
        
    }
    
    
    
    func showHome() {
        guard let navigationController = navigationController else { return }
        if navigationController.viewControllers.contains(where: { $0 is HomeViewController }) {
            print("HomeViewController already in stack")
            return
        }
        print("Pushing HomeViewController")
        let homeViewController = HomeViewController()
        navigationController.pushViewController(homeViewController, animated: true)
        
        // 구독 해제
        cancellables.removeAll()
    }
}
