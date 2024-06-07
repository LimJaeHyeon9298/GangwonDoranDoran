//
//  MainTabController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit


class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
        tabBar.backgroundColor = .white
        
        
    }
    
    
    
    func templateNavigationController(image:UIImage?,rootViewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.barTintColor = .white
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        nav.navigationBar.standardAppearance = appearance
        nav.navigationBar.scrollEdgeAppearance = nav.navigationBar.standardAppearance
       
        return nav
    }
    
    
    func configureViewControllers() {
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let homeVC = HomeViewController()
        let thirdVC = ThirdViewController()
        let fourthVC = FourthViewController()
        
        let nav1 = templateNavigationController(image: UIImage(systemName: "person.fill"), rootViewController: firstVC)
        let nav2 = templateNavigationController(image:  UIImage(systemName: "pencil"), rootViewController: secondVC)
        let nav3 = templateNavigationController(image: UIImage(systemName: "person.fill"), rootViewController: homeVC)
        let nav4 = templateNavigationController(image:  UIImage(systemName: "pencil"), rootViewController: thirdVC)
        let nav5 = templateNavigationController(image: UIImage(systemName: "person.fill"), rootViewController: fourthVC)
        
 
        nav1.tabBarItem.title = "프로필"
        nav2.tabBarItem.title = "연필"
        nav3.tabBarItem.title = "home"
        nav4.tabBarItem.title = "연필"
        nav5.tabBarItem.title = "프로필"


        viewControllers = [nav1, nav2,nav3,nav4,nav5]
        
    }
    
    
    
}
