//
//  SettingCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit


class SettingCoordinator: Coordinator {
   
    
    var children = [Coordinator]()
    var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let settingViewController = SettingViewController()
        settingViewController.coordinator = self
        navigationController?.viewControllers = [settingViewController]
    }

//    // 예: 설정 내부의 다른 화면으로 전환
//    func showProfileSettings() {
//        let profileSettingsViewController = ProfileSettingsViewController()
//        navigationController?.pushViewController(profileSettingsViewController, animated: true)
//    }
}
