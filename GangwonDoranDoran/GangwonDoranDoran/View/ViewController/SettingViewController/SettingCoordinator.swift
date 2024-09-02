//
//  SettingCoordinator.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 7/13/24.
//

import UIKit


enum SettingDestination {
    case writePostList
    case personalInfo
    case notice
    case appInfo
}

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

    func navigateTo(_ destination:SettingDestination) {
        switch destination {
        case .writePostList:
            let writePostListVC = WritePostListViewController()
            NotificationCenter.default.post(name: NSNotification.Name("HideTabBar"), object: nil)
            navigationController?.pushViewController(writePostListVC, animated: true)
        case .personalInfo:
            let personalInfoVC = PersonInfoViewController()
            NotificationCenter.default.post(name: NSNotification.Name("HideTabBar"), object: nil)
            navigationController?.pushViewController(personalInfoVC, animated: true)
        case .notice:
            let noticeVC = NoticeViewController()
            NotificationCenter.default.post(name: NSNotification.Name("HideTabBar"), object: nil)
            navigationController?.pushViewController(noticeVC, animated: true)
        case .appInfo:
            let appInfoVC = AppInfoViewController()
            NotificationCenter.default.post(name: NSNotification.Name("HideTabBar"), object: nil)
            navigationController?.pushViewController(appInfoVC, animated: true)
        }
    }
    
    
//    // 예: 설정 내부의 다른 화면으로 전환
//    func showProfileSettings() {
//        let profileSettingsViewController = ProfileSettingsViewController()
//        navigationController?.pushViewController(profileSettingsViewController, animated: true)
//    }
}
