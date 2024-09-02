//
//  PagingView.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/1/24.
//

import UIKit
import SnapKit

class PagingView: UIView {
    
    private let categoryTitleList: [String]
    private var catregoryLabelList: [String] = [
    "",
    "여행코스 한눈에 보기",
     "다채로운 맛집 리스트 ",
     "힐링을 전하는 숙박지",
     "강원도의 역사 유적지",
     "색다른 매력의 축제",
     "쇼핑의 재미를 느끼자"
    ]
    
    private let categoryImageName: [String] = ["","추천코스","추천맛집","추천숙박","역사유적지","추천축제","쇼핑명소"]
    
//    private lazy var scrollView: UIScrollView = {
//           let scrollView = UIScrollView()
//           scrollView.showsVerticalScrollIndicator = false
//           scrollView.translatesAutoresizingMaskIntoConstraints = false
//        scrollView.backgroundColor = .red
//           return scrollView
//       }()
//       
//       private lazy var contentView: UIView = {
//           let view = UIView()
//           view.translatesAutoresizingMaskIntoConstraints = false
//           return view
//       }()

    private let pagingTabBar: PagingTabBar
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
       
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PagingCollectionViewCell.self, forCellWithReuseIdentifier: PagingCollectionViewCell.identifier)
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
        
        return collectionView
    }()
    
    init(categoryTitleList: [String], pagingTabBar: PagingTabBar) {
        self.categoryTitleList = categoryTitleList
        self.pagingTabBar = pagingTabBar
        super.init(frame: .zero)
        setupLayout()
        pagingTabBar.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PagingView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewFrame = collectionView.frame
        return CGSize(width: collectionViewFrame.width, height: collectionViewFrame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let indexPath = IndexPath(row: Int(targetContentOffset.pointee.x / UIScreen.main.bounds.width), section: 0)
        pagingTabBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .centeredHorizontally)
    }
}

extension PagingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryTitleList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PagingCollectionViewCell.identifier, for: indexPath) as? PagingCollectionViewCell else { return UICollectionViewCell() }
        
        if indexPath.row == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.identifier, for: indexPath) as? MainCollectionViewCell else {
                            return UICollectionViewCell()
                        }
                        return cell
        } else {
            cell.setupView(title: categoryTitleList[indexPath.row],
                           mainLabel: catregoryLabelList[indexPath.row],
                           imageName: categoryImageName[indexPath.row])
            
            return cell
        }
        
        
    }
}

extension PagingView: PagingDelegate {
    func didTapPagingTabBarCell(scrollTo indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    }
}

private extension PagingView {
    func setupLayout() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
