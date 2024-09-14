//
//  HomeViewModel.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 6/7/24.
//

import UIKit
import Combine


final class HomeViewModel {
    private let apiService: APIServiceProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(apiService: APIServiceProtocol) {
        self.apiService = apiService
    }
    
    func fetchTouristInfo(request: LocationBasedListRequest) {
        let apiRequest = EndPoint.locationBasedList1(request: request)
        
        apiService.request(api: apiRequest, responseType: LocationBasedListResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
            })
            .store(in: &cancellables)
        
        
        }
    
    func fetchSearchKeyword(requset:SearchKeywordRequest) {
        let apiRequest = EndPoint.searchKeyword1(request: requset)
        
        apiService.request(api: apiRequest, responseType: SearchKeywordResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
            })
            .store(in: &cancellables)
    }
    
    func fetchFestivalInfo(request:SearchFestivalRequest) {
        let apiRequest = EndPoint.searchFestival1(request: request)
        
        apiService.request(api: apiRequest, responseType: FestivalInfoResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
            })
            .store(in: &cancellables)
    }
    
    func fetchStayInfo(request:SearchStayRequest) {
        let apiRequest = EndPoint.searchStay1(request: request)
        
        apiService.request(api: apiRequest, responseType: StayInfoResponse.self)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Request completed successfully.")
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }, receiveValue: { response in
                print("Received response: \(response)")
            })
            .store(in: &cancellables)
        
        
    }
    
    
}
