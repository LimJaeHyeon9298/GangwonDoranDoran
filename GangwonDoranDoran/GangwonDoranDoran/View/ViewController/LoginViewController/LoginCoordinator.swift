//
//  LoginCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/14/24.
//

import UIKit
import Combine

class LoginCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var children = [Coordinator]()
    var loginSuccessPublisher = PassthroughSubject<Void, Never>()
    private var cancellables = Set<AnyCancellable>()
    weak var parentCoordinator: AppCoordinator?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        print("LoginCoordinator: start called")
        let loginViewModel = LoginViewModel()
        let loginViewController = LoginViewController(viewModel: loginViewModel)
        loginViewController.coordinator = self
        navigationController?.setViewControllers([loginViewController], animated: true)

        loginViewModel.navigationMainPublisher
            .sink { [weak self] in
                print("LoginCoordinator: Login success received")
                self?.loginSuccessPublisher.send(())
                self?.parentCoordinator?.showMain()
            }
            .store(in: &cancellables)
    }

    func showMain() {
        parentCoordinator?.showMain()
    }
}
