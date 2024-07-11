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
import GoogleSignIn
import Firebase
import FirebaseAuth
import CryptoKit
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewModel:NSObject {
    
    private var navigateToHomeSubject = PassthroughSubject<Void,Never>()
    var navigationHomePublisher:AnyPublisher<Void,Never> {
        navigateToHomeSubject
            .eraseToAnyPublisher()
    }
    
    fileprivate var currentNonce: String?
    
    func loginAction(for type: LoginType, presentingViewController: UIViewController) {
        switch type {
        case .google:
            print("Google 로그인 처리")
            loginWithGoogle(presentingViewController: presentingViewController)
        case .kakao:
            print("Kakao 로그인 처리")
            requestKakaoOauth()
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
        let nonce = randomNonceString()
        currentNonce = nonce // 여기서 currentNonce를 설정합니다.
        
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email] //유저로 부터 알 수 있는 정보들(name, email)
        request.nonce = sha256(nonce)
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
    }
    
    
    func loginWithGoogle(presentingViewController: UIViewController) {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { [unowned self] result, error in
            guard error == nil else {
                print("Error occurred: \(error?.localizedDescription ?? "No error description")")
                return
            }
            
            guard let user = result?.user else {
                print("Google Sign In Error: Missing user")
                return
            }
            
            print("user \(user)")
            
            // 강제 언래핑 사용하여 idToken과 accessToken 추출
            let idToken = user.idToken!.tokenString
            let accessToken = user.accessToken.tokenString
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
            
            print("idToken \(idToken)")
            print("accessToken \(accessToken)")
            
            // Firebase authentication
            Auth.auth().signIn(with: credential) { authResult, error in
                if let error = error {
                    print("Firebase Sign In Error: \(error.localizedDescription)")
                } else {
                    // Navigate to home on successful sign in
                    self.navigateToHome()
                }
            }
        }
    }
    
    
    
    func loginWithKaKao() {
        if AuthApi.hasToken() {
            UserApi.shared.accessTokenInfo { accessTokenInfo, error in
                if let error = error {
                    print("DEBUG: 카카오톡 토큰 가져오기 에러 \(error.localizedDescription)")
                    self.requestKakaoOauth()
                } else {
                    
                }
            }
        } else {
            
            self.requestKakaoOauth()
        }
        
    }
    
    func requestKakaoOauth() {
        
        if (UserApi.isKakaoTalkLoginAvailable()) {
            print("카카카카카카카ㅏ카카카카카카카카카카카카카")
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                
                print("하하하하하하하하하하하하하하하하하하하하하하하")
                if let error = error {
                    print(error.localizedDescription)
                    print("z카카오톡 로그인 실패 ")
                }
                else {
                    print("loginWithKakaoTalk() success.")
                    
                    //do something
                    if let token = oauthToken {
                        print("카카오톡 토큰\(token) ")
                        self.loginInFirebase()
                    }
                    //                    _ = oauthToken
                }
            }
        } else {
            
            
            UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoAccount() success.")
                    
                    //do something
                    //                        _ = oauthToken
                    if let token = oauthToken {
                        print("카카오톡 토큰\(token) ")
                        self.loginInFirebase()
                    }
                }
            }
            
            
        }
        
        
    }
    
    func loginInFirebase() {
        UserApi.shared.me { user, error in
            if let error = error {
                print("DEBUG: 카카오톡 사용자 정보가져오기 에러 \(error.localizedDescription)")
            } else {
                print("DEBUG: 카카오톡 사용자 정보가져오기 success.")
                
                Auth.auth().createUser(withEmail: (user?.kakaoAccount?.email)!, password: "\(String(describing: user?.id))") { result, error in
                    if let error = error {
                        print("DEBUG: 파이어베이스 사용자 생성 실패 \(error.localizedDescription)")
                        Auth.auth().signIn(withEmail: (user?.kakaoAccount?.email)!,
                                           password: "\(String(describing: user?.id))") { result, error in
                            
                            if let error = error {
                                print("DEBUG: 파이어베이스 로그인 실패 \(error.localizedDescription)")
                            } else {
                                print("DEBUG: 파이어베이스 로그인 성공")
                                self.navigateToHome()
                            }
                        }
                        
                    } else {
                        print("DEBUG: 파이어베이스 사용자 생성")
                        self.navigateToHome()
                        
                    }
                }
            }
            
            
        }
    }
    
}


extension LoginViewModel: ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        // todo - 윈도우 설정
        return UIWindow()
    }
    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        var randomBytes = [UInt8](repeating: 0, count: length)
        let errorCode = SecRandomCopyBytes(kSecRandomDefault, randomBytes.count, &randomBytes)
        if errorCode != errSecSuccess {
            fatalError(
                "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
            )
        }
        
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        
        let nonce = randomBytes.map { byte in
            // Pick a random character from the set, wrapping around if needed.
            charset[Int(byte) % charset.count]
        }
        
        return String(nonce)
    }
    
    
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            guard let nonce = currentNonce else {
                fatalError("Invalid state: A login callback was received, but no login request was sent.")
            }
            guard let appleIDToken = appleIDCredential.identityToken else {
                print("Unable to fetch identity token")
                return
            }
            guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                return
            }
            
            let credential = OAuthProvider.appleCredential(withIDToken: idTokenString,
                                                           rawNonce: nonce,
                                                           fullName: appleIDCredential.fullName)
            
            Auth.auth().signIn(with: credential) { (authResult, error) in
                if (error != nil) {
                    
                    print(error?.localizedDescription)
                    return
                } else {
                    self.navigateToHome()
                }
            }
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
        print("Sign in with Apple errored: \(error)")
    }
    
}
