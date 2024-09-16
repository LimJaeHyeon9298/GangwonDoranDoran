//
//  BookMarkCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/16/24.
//

import UIKit
import SnapKit
import Then

class BookMarkCell: UICollectionViewCell {
    static let reuseIdentifier = "BookMarkCell"
    // private var thumbnails: [UIImage] = []

    
    private let photoImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.clipsToBounds = true
     //   $0.layer.cornerRadius = 35
    }
    
    private let destinationLabel = UILabel().then {
        $0.text = "여행지 명"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private let descriptionLabel = UILabel().then {
        $0.text = "여행지 설명"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    
    private let ratingLabel = UILabel().then {
        $0.text = "여행지 평점"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "#태그 #여행관련"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }

    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .kakaoColor
        configureCell()
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        addSubview(photoImageView)
        addSubview(destinationLabel)
        addSubview(descriptionLabel)
        addSubview(ratingLabel)
        addSubview(tagLabel)
        
        photoImageView.image = UIImage(named: "appleIcon")
        
        photoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(8)
            $0.width.height.equalTo(99)
        }
        
        destinationLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.leading.equalTo(photoImageView.snp.trailing).offset(15)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(destinationLabel.snp.bottom).offset(4)
            $0.leading.equalTo(destinationLabel.snp.leading)
        }
        
        ratingLabel.snp.makeConstraints {
            $0.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            $0.leading.equalTo(descriptionLabel.snp.leading)
        }
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(ratingLabel.snp.bottom).offset(8)
            $0.leading.equalTo(ratingLabel.snp.leading)
        }
        
        
        
    }
    
    private func createThumbnailLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 8
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    func configure(with thumbnails: [UIImage]) {
       // self.thumbnails = thumbnails
      //  thumbnailCollectionView.reloadData()
    }

    
}


extension BookMarkCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.reuseIdentifier, for: indexPath) as? ThumbnailCell else {
            return UICollectionViewCell()
        }
      //  cell.imageView.image = thumbnails[indexPath.item]
        return cell
    }
}
