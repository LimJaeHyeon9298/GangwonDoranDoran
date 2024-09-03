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

class LoginViewController: UIViewController {
   
    var viewModel: LoginViewModel
    weak var coordinator: Coordinator?
    var cancellables = Set<AnyCancellable>()
    
    var logoView = UIImageView().then {
        $0.image = UIImage(named: "appLogo")
        $0.contentMode = .scaleAspectFill
        $0.backgroundColor = .white
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
        view.backgroundColor = .white
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
        let googleButton = createButton(for: .google)
            googleButton.tag = LoginType.google.tag
       
        let kakaoButton = createButton(for: .kakao)
            kakaoButton.tag = LoginType.kakao.tag
       
        let appleButton = createButton(for: .apple)
            appleButton.tag = LoginType.apple.tag
        
        googleButton.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
        kakaoButton.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
        appleButton.addTarget(self, action: #selector(handleButtonTap(_:)), for: .touchUpInside)
        
     
        
        // StackView 설정
        let stackView = UIStackView(arrangedSubviews: [ googleButton, kakaoButton, appleButton]).then {
            $0.axis = .vertical
            $0.distribution = .fill
            $0.spacing = 10
            $0.alignment = .fill
        }
        
        // StackView 레이아웃 설정
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(32)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
            googleButton.snp.makeConstraints {
                $0.height.equalTo(58)
            }
            kakaoButton.snp.makeConstraints {
                $0.height.equalTo(58)
            }
            appleButton.snp.makeConstraints {
                $0.height.equalTo(58)
            }
      
              
        
        
        
    }
    
    @objc private func handleButtonTap(_ sender: UIButton) {
        guard let loginType = LoginType(tag: sender.tag) else { return }
               viewModel.loginActionSubject.send((loginType, self))
       }

    private func navigateToHome() {
            print("Home 화면으로 이동합니다.")
            // 다음 화면으로의 네비게이션 로직 추가
        }
    
    private func createButton(for type: LoginType) -> UIButton {
        if type == .kakao {
            let button = UIButton()
            button.setImage(type.backgroundImage, for: .normal)
            button.backgroundColor = type.backgroundColor
            button.layer.cornerRadius = 8
            button.showsTouchWhenHighlighted = false
            button.adjustsImageWhenHighlighted = false
            return button
        } else {
            return SocialLoginButton(icon: type.icon!, title: type.title!, backgroundColor: type.backgroundColor, textColor: type.textColor)
        }
    }
    
    private func setButtonConstraints(_ button: UIButton) {
        button.snp.makeConstraints {
            $0.width.equalTo(344)
            $0.height.equalTo(52)
        }
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


