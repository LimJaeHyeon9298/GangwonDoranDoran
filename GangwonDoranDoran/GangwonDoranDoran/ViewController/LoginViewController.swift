//
//  LoginViewController.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import SnapKit
import Then
import AuthenticationServices


enum LoginType {
    case google
    case kakao
    case apple
    case guest
}

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupLoginButtons()
    }
    
    private func setupLoginButtons() {
        
        
        let googleButton = createCustomButton(title: "Google로 계속하기",imageName: "Google_icon",type: .google)
        let kakaoButton = createCustomButton(title: "Kakao로 계속하기", imageName: "Kakao_icon",backgroundColor: .kakaoColor,type: .kakao)
        let appleButton = createCustomButton(title: "Apple로 계속하기", imageName: "Apple_icon",type: .apple)
        let guestButton = createCustomButton(title: "guest로 둘러보기", borderColor: .black,borderWidth: 1,type: .guest)
        
        
        // StackView 설정
        let stackView = UIStackView(arrangedSubviews: [guestButton,googleButton, kakaoButton, appleButton]).then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.spacing = 16
            $0.alignment = .fill
        }
        
        // StackView 레이아웃 설정
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.leading.trailing.equalToSuperview().inset(20)
           // make.height.equalTo(300)
        }
        // 개별 버튼 높이 설정
            guestButton.snp.makeConstraints { make in
                make.height.equalTo(40)  // guest 버튼의 높이를 다르게 설정
            }
            googleButton.snp.makeConstraints { make in
                make.height.equalTo(60)
            }
            kakaoButton.snp.makeConstraints { make in
                make.height.equalTo(60)
            }
            appleButton.snp.makeConstraints { make in
                make.height.equalTo(60)
            }
        
        
        
        
    }

    private func createCustomButton(title: String, imageName: String? = nil, backgroundColor: UIColor = .white, textColor: UIColor = .black, fontSize: CGFloat = 16, borderColor: UIColor? = nil, borderWidth: CGFloat = 0, type: LoginType) -> UIButton {
        let button = UIButton(type: .system)
        
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = backgroundColor
        config.baseForegroundColor = textColor
        config.title = title
        config.titleAlignment = .center
        config.imagePadding = 70
        //config.titlePadding = 20
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
         button.contentHorizontalAlignment = .leading
        config.cornerStyle = .capsule
        
        if let imageName = imageName {
            config.image = UIImage(named: imageName)
            config.imagePlacement = .leading
            
        }
        
        if let borderColor = borderColor {
            config.background.strokeColor = borderColor
            config.background.strokeWidth = borderWidth
        }
        
        button.configuration = config
        button.addAction(UIAction(handler: { [weak self] _ in
            self?.loginAction(for: type)
        }), for: .touchUpInside)
        
        return button
    }
//    private func createCustomButton(title: String, imageName: String? = nil, backgroundColor: UIColor = .white, textColor: UIColor = .black, fontSize: CGFloat = 16, borderColor: UIColor? = nil, borderWidth: CGFloat = 0, type: LoginType) -> UIButton {
//        let button = UIButton(type: .system)
//        
//        // Configuration for the button
//        var config = UIButton.Configuration.filled()
//        config.baseBackgroundColor = backgroundColor
//        config.baseForegroundColor = textColor
//        config.title = title
//        config.titleAlignment = .center  // Title 중앙 정렬
//        config.cornerStyle = .medium // 버튼의 모서리 스타일
//        
//        // Content Insets 조절
//        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)
//
//        // Set the font size for the button title
//        config.attributedTitle = AttributedString(title, attributes: AttributeContainer([
//            .font: UIFont.systemFont(ofSize: fontSize),
//            .foregroundColor: textColor
//        ]))
//        
//        // 이미지 설정
//        if let imageName = imageName {
//            config.image = UIImage(named: imageName)
//            config.imagePlacement = .leading  // 이미지 위치 설정
//            config.imagePadding = 40  // 이미지와 텍스트 사이 간격
//        }
//
//        // Border 설정
//        if let borderColor = borderColor {
//            config.background.strokeColor = borderColor
//            config.background.strokeWidth = borderWidth
//        }
//
//        // Apply configuration to the button
//        button.configuration = config
//        button.addAction(UIAction(handler: { [weak self] _ in
//            self?.loginAction(for: type)
//        }), for: .touchUpInside)
//
//        return button
//    }
    
    private func loginAction(for type: LoginType) {
           switch type {
           case .google:
               print("Google 로그인 처리")
           case .kakao:
               print("Kakao 로그인 처리")
           case .apple:
               print("Apple 로그인 처리")
           case .guest:
               print("guest 둘러보기")
           }
       }
    
}


