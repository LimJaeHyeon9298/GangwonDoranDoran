//
//  HomeViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Then
import Combine
import SnapKit


class HomeViewController: UIViewController {

    private let categoryTitleList = ["메인","코스", "맛집", "숙박", "역사","축제","쇼핑" ]
    
    private lazy var hahaButton = UIButton()
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)
    
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
}

private extension HomeViewController {
    func setupLayout() {
        [
            pagingTabBar,
            pagingView,
            hahaButton
        ].forEach { view.addSubview($0) }
        
        pagingTabBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(pagingTabBar.cellHeight)
        }
        pagingView.snp.makeConstraints { make in
            make.top.equalTo(pagingTabBar.snp.bottom)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
//        hahaButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide)
//            make.leading.trailing.equalToSuperview()
//            make.height.equalTo(30)
//        }
        
//        hahaButton.setTitle("hihi", for: .normal)
//        hahaButton.backgroundColor = .red
        
    }
}

