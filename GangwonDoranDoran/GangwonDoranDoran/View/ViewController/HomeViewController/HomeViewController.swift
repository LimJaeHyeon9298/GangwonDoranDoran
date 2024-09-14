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
    
    var viewModel: HomeViewModel
    
    private let categoryTitleList = ["메인","코스", "맛집", "숙박", "역사","축제","쇼핑" ]
    private lazy var hahaButton = UIButton()
    private lazy var pagingTabBar = PagingTabBar(categoryTitleList: categoryTitleList)
    private lazy var pagingView = PagingView(categoryTitleList: categoryTitleList, pagingTabBar: pagingTabBar)
    
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    init(viewModel:HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        setupBindings()
        
    }
    
    private func setupBindings() {
           let baseRequest = BaseRequest()
           let request = LocationBasedListRequest(
               baseRequest: baseRequest,
               mapX: "126.981611",
               mapY: "37.568477",
               radius: "1000"
           )
        
        let keyWord = "food".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "food"
        
        
          let searchKeyword = SearchKeywordRequest(
            baseRequest: baseRequest,
            keyword: keyWord)
        
        
        let festival = SearchFestivalRequest(baseRequest: baseRequest, eventStartDate: "20240914")
        
        viewModel.fetchFestivalInfo(request: festival)
        
        
        let stay = SearchStayRequest(baseRequest: baseRequest)
        
        
     //   viewModel.fetchStayInfo(request: stay)
           
     //      viewModel.fetchTouristInfo(request: request)
       // viewModel.fetchSearchKeyword(requset:searchKeyword)
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

