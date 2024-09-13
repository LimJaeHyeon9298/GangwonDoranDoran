//
//  APIClient.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/7/24.
//

import UIKit
import Combine

protocol APIServiceProtocol {
    func request<T: Decodable>(api: Router, responseType: T.Type) -> AnyPublisher<T, Error>
}

final class APIClient: APIServiceProtocol {
    func request<T: Decodable>(api: Router, responseType: T.Type) -> AnyPublisher<T, Error> {
           guard let urlRequest = api.asURLRequest() else {
               return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
           }
        
        print("Request URL: \(urlRequest.url?.absoluteString ?? "Invalid URL")")
           
           return URLSession.shared.dataTaskPublisher(for: urlRequest)
               .tryMap { data, response -> Data in
                   // 받은 데이터를 문자열로 출력
                   if let jsonString = String(data: data, encoding: .utf8) {
                       print("Raw JSON data received from server: \(jsonString)")
                   } else {
                       print("Failed to convert data to String")
                   }
                   
                   return data
               }
               .decode(type: T.self, decoder: JSONDecoder()) // 데이터를 제네릭 타입 T로 디코딩
               .eraseToAnyPublisher()
       }

}
