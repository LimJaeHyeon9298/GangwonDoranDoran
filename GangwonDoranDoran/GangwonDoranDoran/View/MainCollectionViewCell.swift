//
//  MainCollectionViewCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/1/24.
//

import UIKit
import SnapKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCollectionViewCell"
    
    private lazy var specialContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30.0, weight: .bold)
        label.textAlignment = .center
        label.text = "메인 콘텐츠"
        return label
    }()
    
    private lazy var specialImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "mainImage") // "메인" 셀에 맞는 이미지 추가
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        [specialContentLabel, specialImageView].forEach { addSubview($0) }
        
        specialImageView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(200)
        }
        
        specialContentLabel.snp.makeConstraints {
            $0.top.equalTo(specialImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }
    }
}

