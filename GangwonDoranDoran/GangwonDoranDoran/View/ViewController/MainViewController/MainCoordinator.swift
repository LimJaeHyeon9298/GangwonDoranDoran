//
//  MainCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    func showHome() {
        
    }
    
    var navigationController: UINavigationController?
    var children = [Coordinator]()
    var tabBarController: UITabBarController?

    func start() {
        tabBarController = UITabBarController()

        // Home 탭 코디네이터 생성 및 추가
        let homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
        addChild(coordinator: homeCoordinator)
        homeCoordinator.start()

        // Settings 탭 코디네이터 생성 및 추가
        let settingsCoordinator = SettingCoordinator(navigationController: UINavigationController())
        addChild(coordinator: settingsCoordinator)
        settingsCoordinator.start()

        // 탭 바에 각 코디네이터의 네비게이션 컨트롤러 설정
       
        
        tabBarController?.viewControllers = [
            homeCoordinator.navigationController!,
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

