//
//  AppCordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/25/24.
//

import UIKit
import Combine


protocol Coordinator:AnyObject {
    var navigationController: UINavigationController? {get set}
    var children: [Coordinator] { get set }
    func start()
    func addChild(coordinator: Coordinator)
    func removeChild(coordinator: Coordinator)
    func showHome()
}


extension Coordinator {
    func addChild(coordinator: Coordinator) {
        children.append(coordinator)
    }
    
    func removeChild(coordinator: Coordinator) {
        children = children.filter { $0 !== coordinator }
    }
    
    func showHome() {}
    
    
}

class AppCoordinator:Coordinator {
    var children = [Coordinator]()
    private var isShowingHome = false
    
    var navigationController: UINavigationController?
    private var cancellables = Set<AnyCancellable>()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        if isUserLoggedIn() {
//                   let mainCoordinator = MainCoordinator(navigationController: navigationController!)
//                   addChild(coordinator: mainCoordinator)
//                   mainCoordinator.start()
               } else {
//                   let loginCoordinator = LoginCoordinator(navigationController: navigationController!)
//                   addChild(coordinator: loginCoordinator)
//                   loginCoordinator.start()
                   showLogin()
               }
    }
    
    func showLogin() {
            print("AppCoordinator: showLogin called")
            let loginCoordinator = LoginCoordinator(navigationController: navigationController!)
            loginCoordinator.parentCoordinator = self
            addChild(coordinator: loginCoordinator)
            loginCoordinator.start()

            loginCoordinator.loginSuccessPublisher
                .sink { [weak self] in
                    print("AppCoordinator: Login success received")
                    self?.removeChild(coordinator: loginCoordinator)
                    self?.showHome()
                }
                .store(in: &cancellables)
        }

    func showHome() {
        
        guard !isShowingHome else { return }
                isShowingHome = true // 플래그 설정
                print("AppCoordinator: showHome called")
          print("AppCoordinator: showHome called")
          guard let navigationController = navigationController else {
              print("AppCoordinator: navigationController is nil")
              return
          }
          let homeCoordinator = HomeCoordinator(navigationController: navigationController)
          addChild(coordinator: homeCoordinator)
          homeCoordinator.start()
          print("AppCoordinator: HomeCoordinator added, children count: \(children.count)")
      }
    
    func addChild(coordinator:Coordinator) {
        children.append(coordinator)
        print("Child Coordinator added, children count: \(children.count)")
    }
    
    func removeChild(coordinator:Coordinator) {
        children = children.filter { $0 !== coordinator }
       print("Child Coordinator removed, children count: \(children.count)")
    }
    
    
    private func isUserLoggedIn() -> Bool {
            // 토큰 유효성 검사 로직
            return false
        }
    
    
}
