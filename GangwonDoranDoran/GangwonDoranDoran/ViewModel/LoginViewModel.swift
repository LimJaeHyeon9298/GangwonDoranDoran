//
//  LoginViewModel.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/25/24.
//

import UIKit
import Combine

class LoginViewModel {
    
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
           case .guest:
               print("guest 둘러보기")
             navigateToHome()
           }
       }
    
    func navigateToHome() {
     print("navigateToHome called")
        navigateToHomeSubject.send()
    }
}
