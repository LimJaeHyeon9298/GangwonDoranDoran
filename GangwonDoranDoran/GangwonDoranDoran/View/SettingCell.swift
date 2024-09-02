//
//  SettingCell.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/2/24.
//

import UIKit
import SnapKit
import Then

class SettingCell:UITableViewCell {
    static let reuseIdentifier = "SettingCell"
    
    var iconImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.image = UIImage(named: "Vector")?.withRenderingMode(.alwaysTemplate)
       // $0.backgroundColor = .systemBlue
        //UIImage(named: "Vector")?.withRenderingMode(.alwaysTemplate)
    }
    var titleLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.numberOfLines = 0
    }
    
    var accessoryButton = UIButton().then {
        $0.setImage(UIImage(systemName: "chevron.right"), for: .normal)
       // $0.isHidden = true
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLayout() {
        [iconImageView, titleLabel, accessoryButton].forEach {
            contentView.addSubview($0)
        }
        
        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
           $0.size.equalTo(20)
           
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(50) // `iconImageView`와 16포인트 간격 설정
         //   $0.trailing.lessThanOrEqualTo(accessoryButton.snp.leading).offset(-16) // `accessoryButton`과의 최소 간격 설정
        }
        
//        accessoryButton.snp.makeConstraints {
//            $0.centerY.equalToSuperview()
//            $0.trailing.equalToSuperview().offset(-20)
//          
//        }
        
        self.selectionStyle = .none
    }
}
