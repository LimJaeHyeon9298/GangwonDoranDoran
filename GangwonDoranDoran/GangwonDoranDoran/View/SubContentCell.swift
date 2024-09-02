//
//  SubContentCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/2/24.
//

import UIKit
import SnapKit
import Then

class SubContentCell: UICollectionViewCell {
   
    static let identifier = "SubContentCell"
    
    private let contentImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.backgroundColor = .red
        $0.image = UIImage(named: "Apple_icon")
    }
    private let contentTitleLabel = UILabel().then {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 16)
        $0.text = "하하하하"
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        [contentImageView, contentTitleLabel].forEach { addSubview($0) }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(8)
            $0.leading.equalToSuperview().offset(8)
            $0.trailing.equalToSuperview().inset(8)
            $0.height.equalTo(85)
        }
        
        contentTitleLabel.snp.makeConstraints {
            $0.top.equalTo(contentImageView.snp.bottom).offset(4)
            $0.centerX.equalToSuperview()
        }
        
    }
    
}
