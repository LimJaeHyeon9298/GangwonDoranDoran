//
//  SecondViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Combine
import SnapKit
import Then

class SecondViewController:UIViewController {
    
    private lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout()).then {
        $0.isScrollEnabled = true
              $0.showsHorizontalScrollIndicator = false
              $0.showsVerticalScrollIndicator = true
              $0.scrollIndicatorInsets = UIEdgeInsets(top: -2, left: 0, bottom: 0, right: 4)
              $0.contentInset = .zero
              $0.backgroundColor = .clear
              $0.clipsToBounds = true
              $0.register(CommunityCell.self, forCellWithReuseIdentifier: "CommunityCell")
              $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .red
    }
    
    
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        configureCollectionView()
        collectionView.dataSource = self
        collectionView.delegate = self
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
                                                  heightDimension: .absolute(265))
           let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
           
           // 섹션 설정
           let section = NSCollectionLayoutSection(group: group)
           section.interGroupSpacing = 10
           section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
           
           // 최종 레이아웃 구성
           return UICollectionViewCompositionalLayout(section: section)
       }
    
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CommunityCell", for: indexPath) as? CommunityCell else {return UICollectionViewCell()}
        
        return cell
    }
    
    
}

extension SecondViewController: UICollectionViewDelegate {
 
}
