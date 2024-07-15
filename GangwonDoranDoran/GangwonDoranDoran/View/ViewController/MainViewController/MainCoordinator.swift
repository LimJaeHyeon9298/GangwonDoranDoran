//
//  MainCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
  
    var navigationController: UINavigationController?
    var children = [Coordinator]()
    var tabBarController: MainTabController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        tabBarController = MainTabController()
        tabBarController?.coordinator = self

        // Home 탭 코디네이터 생성 및 추가
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        addChild(coordinator: homeCoordinator)
        homeCoordinator.start()

        // Settings 탭 코디네이터 생성 및 추가
        let settingsCoordinator = SettingCoordinator(navigationController: UINavigationController())
        addChild(coordinator: settingsCoordinator)
        settingsCoordinator.start()
        
        let firstCoordinator = FirstCoordinator(navigationController: UINavigationController())
        addChild(coordinator: firstCoordinator)
        firstCoordinator.start()
        
        let secondCoordinator = SecondCoordinator(navigationController: UINavigationController())
        addChild(coordinator: secondCoordinator)
        secondCoordinator.start()
        
        let thirdCoordinator = ThirdCoordinator(navigationController: UINavigationController())
        addChild(coordinator: thirdCoordinator)
        thirdCoordinator.start()
  
        tabBarController?.viewControllers = [
            firstCoordinator.navigationController!, // black green gray bri
            secondCoordinator.navigationController!,
            homeCoordinator.navigationController!,
            thirdCoordinator.navigationController!,
            settingsCoordinator.navigationController!
        ]
        // 메인 네비게이션 컨트롤러에 탭 바 컨트롤러 푸시
        navigationController?.pushViewController(tabBarController!, animated: false)
    }

    func addChild(coordinator: Coordinator) {
        children.append(coordinator)
    }

    func removeChild(coordinator: Coordinator) {
        children = children.filter { $0 !== coordinator }
    }
}

