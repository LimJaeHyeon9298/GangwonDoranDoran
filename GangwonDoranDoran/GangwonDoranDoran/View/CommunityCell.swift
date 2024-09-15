//
//  CommunityCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/15/24.
//

import UIKit
import SnapKit
import Then

class CommunityCell: UICollectionViewCell {
    static let reuseIdentifier = "CommunityCell"
    // private var thumbnails: [UIImage] = []
    private var thumbnails: [UIImage] = {
        var images = [UIImage]()

        if let image1 = UIImage(systemName: "photo"),
           let image2 = UIImage(systemName: "photo.on.rectangle"),
           let image3 = UIImage(systemName: "rectangle.stack"),
           let image4 = UIImage(systemName: "camera") {
            images.append(image1)
            images.append(image2)
            images.append(image3)
            images.append(image4)
        }
        
        return images
    }()
    
    private let profileImageView = UIImageView().then {
        $0.backgroundColor = .lightGray
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 35
    }
    
    private let titleLabel = UILabel().then {
        $0.text = "작성 글 제목"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 25, weight: .bold)
    }
    
    private let regionLabel = UILabel().then {
        $0.text = "여행 지역"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    
    private let timeLabel = UILabel().then {
        $0.text = "2024-09-15"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    private let tagLabel = UILabel().then {
        $0.text = "#태그 #여행관련"
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 17, weight: .semibold)
    }
    
    private lazy var thumbnailCollectionView = UICollectionView(frame: .zero, collectionViewLayout: createThumbnailLayout()).then {
        $0.isScrollEnabled = false
        $0.showsHorizontalScrollIndicator = false
        $0.register(ThumbnailCell.self, forCellWithReuseIdentifier: ThumbnailCell.reuseIdentifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var favoritesStackView = createImageLabelStackView(image: UIImage(systemName: "star"), text: "즐찾수")
    private lazy var commentsStackView = createImageLabelStackView(image: UIImage(systemName: "bubble.left"), text: "댓글수")
    private lazy var viewsStackView = createImageLabelStackView(image: UIImage(systemName: "eye"), text: "조회수")
    
    private lazy var actionStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 2 // 스택 간의 간격
        $0.backgroundColor = UIColor.systemGray6
        $0.layer.cornerRadius = 10
        // $0.alignment = .center
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .kakaoColor
        configureCell()
        thumbnailCollectionView.dataSource = self
        setupViews()
        setupActionStackView()
        favoritesStackView.backgroundColor = .red
        commentsStackView.backgroundColor = .blue
        viewsStackView.backgroundColor = .brown
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCell() {
        addSubview(profileImageView)
        addSubview(titleLabel)
        addSubview(regionLabel)
        addSubview(timeLabel)
        addSubview(tagLabel)
        
        profileImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(8)
            $0.width.height.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(8)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        regionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(regionLabel.snp.bottom).offset(4)
            $0.trailing.equalTo(safeAreaLayoutGuide).inset(8)
        }
        tagLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(8)
            $0.leading.equalTo(safeAreaLayoutGuide).offset(16)
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
        self.thumbnails = thumbnails
        thumbnailCollectionView.reloadData()
    }
    
    private func setupViews() {
        contentView.addSubview(thumbnailCollectionView)
        thumbnailCollectionView.snp.makeConstraints {
            $0.top.equalTo(tagLabel.snp.bottom).offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(100)
        }
        
    }
    
    private func setupActionStackView() {
        // 메인 스택뷰에 세 개의 이미지-라벨 스택뷰 추가
        [favoritesStackView, commentsStackView, viewsStackView].forEach { actionStackView.addArrangedSubview($0) }
        
        contentView.addSubview(actionStackView)
        actionStackView.snp.makeConstraints {
            $0.top.equalTo(thumbnailCollectionView.snp.bottom).offset(8)
            $0.leading.trailing.equalToSuperview().inset(16)
            $0.bottom.equalToSuperview().inset(8)
            //  $0.height.equalTo(44)
        }
        
        actionStackView.backgroundColor = .white
    }
    
    private func createImageLabelStackView(image: UIImage?, text: String) -> UIView {
        let imageView = UIImageView(image: image).then {
            $0.contentMode = .scaleAspectFit
            $0.snp.makeConstraints { make in
                make.width.height.equalTo(20) // 이미지뷰의 크기를 고정
            }
        }
        
        let label = UILabel().then {
            $0.text = text
            $0.textColor = .black
            $0.font = .systemFont(ofSize: 14, weight: .regular)
        }
        
        let containerView = UIView()
        containerView.addSubview(imageView)
        containerView.addSubview(label)
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalToSuperview()
        }
        
        
        return containerView
    }
    
}


extension CommunityCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThumbnailCell.reuseIdentifier, for: indexPath) as? ThumbnailCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = thumbnails[indexPath.item]
        return cell
    }
}
