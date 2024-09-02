//
//  PagingCollectionViewCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/1/24.
//

import UIKit
import SnapKit

//class PagingCollectionViewCell: UICollectionViewCell {
//    
//    static let identifier = "PagingCollectionViewCell"
//    
//    private lazy var scrollView: UIScrollView = {
//           let scrollView = UIScrollView()
//           scrollView.translatesAutoresizingMaskIntoConstraints = false
//           scrollView.showsVerticalScrollIndicator = false
//           return scrollView
//       }()
//    
//    private lazy var contentViewContainer: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    
//    private lazy var contentLabel: UILabel = {
//        let label = UILabel()
//        
//        label.font = .systemFont(ofSize: 24.0, weight: .bold)
//        label.textAlignment = .center
//     //   label.backgroundColor = [.systemOrange, .systemPurple, .systemCyan, .systemMint, .systemBrown, .systemYellow].randomElement()
//        
//        return label
//    }()
//    
//    private lazy var mainImageView: UIImageView = {
//       let iv = UIImageView()
//        iv.image = UIImage(named: "1")
//       // iv.contentMode = .scaleAspectFill
//        iv.backgroundColor = .red
//        return iv
//    }()
//    
//    private lazy var subCollectionView: UICollectionView = {
//           let layout = UICollectionViewFlowLayout()
//           layout.scrollDirection = .vertical
//           layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 40, height: 100) // 하단 컬렉션 뷰의 셀 크기 설정
//           layout.minimumLineSpacing = 10
//           layout.minimumInteritemSpacing = 10
//           
//           let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//           collectionView.showsVerticalScrollIndicator = false
//           collectionView.delegate = self
//           collectionView.dataSource = self
//           collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "SubCell")
//        collectionView.backgroundColor = .red
//           return collectionView
//       }()
//
//    
//    
//    func setupView(title: String,mainLabel:String,imageName:String) {
//        setupLayout()
//        contentLabel.text = mainLabel
//        mainImageView.image = UIImage(named: imageName)
//    }
//}
//
//private extension PagingCollectionViewCell {
//    
//    func setupLayout() {
//        
//        addSubview(scrollView)
//        scrollView.addSubview(contentViewContainer)
//        
//        [mainImageView, contentLabel, subCollectionView].forEach { contentViewContainer.addSubview($0) }
//        
//        
//        scrollView.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//        }
//        
//        contentViewContainer.snp.makeConstraints {
//            $0.edges.equalToSuperview()
//            $0.width.equalToSuperview() // 스크롤 방향이 수직으로 유지
//        }
//        
//        mainImageView.snp.makeConstraints {
//            $0.top.equalToSuperview().inset(20)
//            $0.leading.trailing.equalToSuperview().inset(4)
//         //   $0.trailing.equalToSuperview().inset(4)
//            $0.height.equalTo(300)
//        }
//        
//      
//        
//       
//        
//        contentLabel.snp.makeConstraints {
//            $0.top.equalTo(mainImageView.snp.bottom).offset(8)
//            $0.leading.equalTo(mainImageView.snp.leading).offset(8)
//        }
//        
//        
//        subCollectionView.snp.makeConstraints {
//            $0.top.equalTo(contentLabel.snp.bottom).offset(10)
//            $0.leading.equalToSuperview().offset(20)
//            $0.trailing.equalToSuperview().inset(20)
//            $0.height.equalTo(200) // 하단 컬렉션 뷰의 높이 설정
//            $0.bottom.equalToSuperview() // 스크롤 콘텐츠의 끝을 설정
//        }
//        
//    }
//}
//
//
//extension PagingCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // 하단 컬렉션 뷰의 아이템 수 설정
//        return 10
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        // 하단 컬렉션 뷰 셀 구성
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubCell", for: indexPath)
//        cell.backgroundColor = .systemBlue // 셀의 임시 배경색 설정
//        return cell
//    }
//}

class PagingCollectionViewCell: UICollectionViewCell, UIScrollViewDelegate {
    
    static let identifier = "PagingCollectionViewCell"
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.delegate = self // UIScrollViewDelegate 설정
        return scrollView
    }()
    
    private lazy var contentViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var mainImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "1")
        iv.backgroundColor = .red
        return iv
    }()
    
    private lazy var subCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width / 2) - 20 , height: 120)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isScrollEnabled = false // 스크롤 비활성화, 부모 UIScrollView에 이벤트 전달
        collectionView.register(SubContentCell.self, forCellWithReuseIdentifier: "SubContentCell")
        
        return collectionView
    }()
    
    func setupView(title: String, mainLabel: String, imageName: String) {
        setupLayout()
        contentLabel.text = mainLabel
        mainImageView.image = UIImage(named: imageName)
    }
    
    private func setupLayout() {
        addSubview(scrollView)
        scrollView.addSubview(contentViewContainer)
        
        [mainImageView, contentLabel, subCollectionView].forEach { contentViewContainer.addSubview($0) }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentViewContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        mainImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(300)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageView.snp.bottom).offset(8)
            $0.leading.equalToSuperview().inset(8)
        }
        
        subCollectionView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(400) // 하단 컬렉션 뷰의 높이 설정
            $0.bottom.equalToSuperview()
        }
        subCollectionView.backgroundColor = .red
    }
    
    // MARK: - UIScrollViewDelegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let offsetY = scrollView.contentOffset.y
            let contentHeight = scrollView.contentSize.height
            let frameHeight = scrollView.frame.height
            
            // 스크롤이 끝에 도달했을 때 하위 컬렉션 뷰 스크롤 활성화
            if offsetY >= (contentHeight - frameHeight) {
                subCollectionView.isScrollEnabled = true
            } else {
                subCollectionView.isScrollEnabled = false
            }
        }
    }
}

extension PagingCollectionViewCell: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SubContentCell", for: indexPath) as? SubContentCell else { return  UICollectionViewCell() }
        cell.backgroundColor = .systemBlue
        
        return cell
    }
}
