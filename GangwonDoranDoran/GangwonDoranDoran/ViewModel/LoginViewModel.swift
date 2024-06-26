//
//  LoginViewModel.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/25/24.
//
//
import UIKit
import Combine
import AuthenticationServices

class LoginViewModel:NSObject {
    
    private var navigateToHomeSubject = PassthroughSubject<Void,Never>()
    var navigationHomePublisher:AnyPublisher<Void,Never> {
        navigateToHomeSubject
            .eraseToAnyPublisher()
    }
    
     func loginAction(for type: LoginType) {
           switch type {
           case .google:
               print("Google 로그인 처리")
           case .kakao:
               print("Kakao 로그인 처리")
           case .apple:
               print("Apple 로그인 처리")
               loginWithApple()
           case .guest:
               print("guest 둘러보기")
             navigateToHome()
           }
       }
    
    func navigateToHome() {
        print("navigateToHome called")
        navigateToHomeSubject.send()
    }
    
    func loginWithApple() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email] //유저로 부터 알 수 있는 정보들(name, email)
               
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
}


extension LoginViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    

    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
      // todo - 윈도우 설정
        return UIWindow()
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        // 로그인 성공
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email

            if  let authorizationCode = appleIDCredential.authorizationCode,
                let identityToken = appleIDCredential.identityToken,
                let authCodeString = String(data: authorizationCode, encoding: .utf8),
                let identifyTokenString = String(data: identityToken, encoding: .utf8) {
                print("authorizationCode: \(authorizationCode)")
                print("identityToken: \(identityToken)")
                print("authCodeString: \(authCodeString)")
                print("identifyTokenString: \(identifyTokenString)")
            }

            print("useridentifier: \(userIdentifier)")
            print("fullName: \(String(describing: fullName))")
            print("email: \(String(describing: email))")
            
            // 로그인 성공 후 홈 화면으로 이동
            navigateToHome()

        case let passwordCredential as ASPasswordCredential:
            // 기존 iCloud 키체인 자격 증명을 사용하여 로그인
            let username = passwordCredential.user
            let password = passwordCredential.password

            print("username: \(username)")
            print("password: \(password)")

     
        default:
            print("Unhandled authorization type")
        }
    }

    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // 로그인 실패 (사용자가 취소한 경우 포함)
        print("login failed - \(error.localizedDescription)")
    }
}
