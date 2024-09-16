//
//  WritePostListViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/2/24.
//

import UIKit
import SnapKit
import Then

class WritePostListViewController: UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout()).then {
        $0.isScrollEnabled = true
              $0.showsHorizontalScrollIndicator = false
              $0.showsVerticalScrollIndicator = true
              $0.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
              $0.contentInset = .zero
              $0.backgroundColor = .clear
              $0.clipsToBounds = true
              $0.register(BookMarkCell.self, forCellWithReuseIdentifier: "BookMarkCell")
              $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPink
        configureCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           NotificationCenter.default.post(name: NSNotification.Name("ShowTabBar"), object: nil) // 탭 바 보이기
       }
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
           // 아이템 설정
           let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
           let item = NSCollectionLayoutItem(layoutSize: itemSize)
           
           // 그룹 설정
           let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .absolute(170))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
           
           // 섹션 설정
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 10
           section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
           
           // 최종 레이아웃 구성
           return UICollectionViewCompositionalLayout(section: section)
       }
}

extension WritePostListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookMarkCell", for: indexPath) as? BookMarkCell else {return UICollectionViewCell()}
        
        return cell
    }
    
    
}

extension WritePostListViewController: UICollectionViewDelegate {
 
}
