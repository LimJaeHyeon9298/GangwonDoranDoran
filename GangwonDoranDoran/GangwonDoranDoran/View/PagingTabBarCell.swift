//
//  PagingTabBarCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/1/24.
//

import UIKit
import SnapKit


class PagingTabBarCell: UICollectionViewCell {
    
    static let identifier = "PagingTabBarCell"
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 15.0, weight: .semibold)
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var underline: UIView = {
        let view = UIView()
        
        view.backgroundColor = .systemPink
        view.alpha = 0.0
        
        return view
    }()
    
    
    
    
    override var isSelected: Bool {
        // Cell이 선택 되었을 때 설정
        didSet {
            titleLabel.textColor = isSelected ? .systemPink : .secondaryLabel
            underline.alpha = isSelected ? 1.0 : 0.0
        }
    }
    
    func setupView(title: String) {
        setupLayout()
        titleLabel.text = title
    }
}

private extension PagingTabBarCell {
    func setupLayout() {
        [
            titleLabel,
            underline,
           
        ].forEach { addSubview($0) }
        titleLabel.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
        }
        underline.snp.makeConstraints {
            $0.height.equalTo(3.0)
            $0.top.equalTo(titleLabel.snp.bottom).offset(4.0)
            $0.leading.trailing.bottom.equalToSuperview()
        }
       
    }
}
