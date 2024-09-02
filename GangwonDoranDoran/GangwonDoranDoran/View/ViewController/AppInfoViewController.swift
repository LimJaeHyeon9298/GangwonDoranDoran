//
//  AppInfoViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/2/24.
//

import UIKit

class AppInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           NotificationCenter.default.post(name: NSNotification.Name("ShowTabBar"), object: nil) // 탭 바 보이기
       }
}

