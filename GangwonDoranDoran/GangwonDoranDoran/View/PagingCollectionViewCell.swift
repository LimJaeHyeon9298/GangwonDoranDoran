//
//  PagingCollectionViewCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/1/24.
//

import UIKit
import SnapKit

class PagingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PagingCollectionViewCell"
    
    private lazy var contentLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 24.0, weight: .bold)
        label.textAlignment = .center
     //   label.backgroundColor = [.systemOrange, .systemPurple, .systemCyan, .systemMint, .systemBrown, .systemYellow].randomElement()
        
        return label
    }()
    
    private lazy var mainImageVIew: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "1")
       // iv.contentMode = .scaleAspectFill
        iv.backgroundColor = .red
        return iv
    }()
    
    
    func setupView(title: String,mainLabel:String,imageName:String) {
        setupLayout()
        contentLabel.text = mainLabel
        mainImageVIew.image = UIImage(named: imageName)
    }
}

private extension PagingCollectionViewCell {
    func setupLayout() {
        [mainImageVIew,contentLabel]
            .forEach { addSubview($0) }
        
        mainImageVIew.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().offset(4)
            $0.trailing.equalToSuperview().inset(4)
            $0.height.equalTo(300)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(mainImageVIew.snp.bottom).offset(8)
            $0.leading.equalTo(mainImageVIew.snp.leading).offset(8)
        }
        
    }
}


