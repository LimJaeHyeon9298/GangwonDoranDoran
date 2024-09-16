//
//  EmptyView.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/16/24.
//

import UIKit

class EmptyView: UIView {
    private lazy var emptyLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setUp(){
        backgroundColor = .white
        self.addSubview(emptyLabel)
        
        emptyLabel.snp.makeConstraints { make in
            make.edges.equalTo(self)
            make.center.equalTo(self)
        }
    }

    func configure(_ message: String){
        self.emptyLabel.text = message
    }
}
