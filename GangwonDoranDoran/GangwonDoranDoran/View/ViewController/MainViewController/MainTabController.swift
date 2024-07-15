//
//  MainTabController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Combine


class MainTabController: UITabBarController {
    weak var coordinator: Coordinator?
    private var cancellables = Set<AnyCancellable>()
    let customTabBar = CustomTabView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        setupTabBar()
        bindTabBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            // 네비게이션 바 숨기기
            self.navigationController?.setNavigationBarHidden(true, animated: animated)
        }
    
    func setupTabBar() {
        customTabBar.frame = CGRect(x: 0, y: self.view.frame.height - 80, width: self.view.frame.width, height: 200)
        customTabBar.backgroundColor = .clear
        
        self.view.addSubview(customTabBar)

    }
    
    
     func bindTabBar() {
        customTabBar.buttonTappedPublisher
                    .sink { [weak self] index in
                        self?.didSelectTab(at: index)
                    }
                    .store(in: &cancellables)
    }
   
    private func didSelectTab(at index: Int) {
           print("Tab \(index) selected")
           self.selectedIndex = index  // 선택된 탭 변경
       }

}
