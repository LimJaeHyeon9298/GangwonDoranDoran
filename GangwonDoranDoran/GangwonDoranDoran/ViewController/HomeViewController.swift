//
//  HomeViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Then
import RxSwift
import SnapKit


class HomeViewController:UIViewController {
    
    //    let customView = CustomTabView().then {
    //        $0.backgroundColor = .blue
    //
    //    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let customTabBar = CustomTabView()
        customTabBar.frame = CGRect(x: 0, y: self.view.frame.height - 80, width: self.view.frame.width, height: 200)
        customTabBar.backgroundColor = .clear
        
        self.view.addSubview(customTabBar)
        
    }
    
}
    
