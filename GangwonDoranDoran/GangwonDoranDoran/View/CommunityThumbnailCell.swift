//
//  CommunityThumbnailCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/15/24.
//

import UIKit
import SnapKit
import Then

class ThumbnailCell: UICollectionViewCell {
    static let reuseIdentifier = "ThumbnailCell"

    let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.backgroundColor = .red
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        contentView.addSubview(imageView)
      
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
