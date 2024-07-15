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
import Combine

enum LoginType {
    case google
    case kakao
    case apple
    case guest
}

class LoginViewController: UIViewController {
   
    var viewModel: LoginViewModel
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    var logoView = UIImageView().then {
        $0.image = UIImage(named: "logo_icon")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .lightGray
    }

    init(viewModel: LoginViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupLogo()
        setupLoginButtons()
        bindViewModel()
       
    }
    
    private func setupLogo() {
        view.addSubview(logoView)
        logoView.snp.makeConstraints {
            $0.width.height.equalTo(200)
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(60)
        }
    }
    
    private func setupLoginButtons() {
        let googleButton = createCustomButton(title: "Google로 계속하기", imageName: "Google_icon", type: .google)
        let kakaoButton = createCustomButton(title: "Kakao로 계속하기", imageName: "Kakao_icon", backgroundColor: .yellow, type: .kakao)
        let appleButton = createCustomButton(title: "Apple로 계속하기", imageName: "Apple_icon", type: .apple)
        let guestButton = createCustomButton(title: "guest로 둘러보기", borderColor: .black, borderWidth: 1, type: .guest)
        
        // StackView 설정
        let stackView = UIStackView(arrangedSubviews: [guestButton, googleButton, kakaoButton, appleButton]).then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.spacing = 16
            $0.alignment = .fill
        }
        
        // StackView 레이아웃 설정
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        // 개별 버튼 높이 설정
            guestButton.snp.makeConstraints {
                $0.height.equalTo(40)  // guest 버튼의 높이를 다르게 설정
            }
            googleButton.snp.makeConstraints {
                $0.height.equalTo(60)
            }
            kakaoButton.snp.makeConstraints {
                $0.height.equalTo(60)
            }
            appleButton.snp.makeConstraints {
                $0.height.equalTo(60)
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
            self?.viewModel.loginAction(for: type, presentingViewController: self!)
            print("Button pressed: \(type)")
        }), for: .touchUpInside)
        
        return button
    }

    func bindViewModel() {
        viewModel.navigationMainPublisher
            .sink { [weak self] in
                print("버튼 호출")
                print("Publisher received")
                self?.coordinator?.showMain()
            }
            .store(in: &cancellables)
    }
}


