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
    
    func fetchPetTourInfo(request:DetailPetTourRequest) {
        let apiRequest = EndPoint.detailPetTourInfo(request: request)
        
        apiService.request(api: apiRequest, responseType: DetailPetTourResponse.self)
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
    
    func fetchAreaBasedListInfo(request:AreaBasedListRequest) {
        let apiRequest = EndPoint.areaBasedList1(request: request)
        
        
        apiService.request(api: apiRequest, responseType: AreaBasedListResponse.self)
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
    
    func fetchCategoryCode(request:CategoryCodeRequest) {
        let apiRequest = EndPoint.categoryCode(request: request)
        
        
        apiService.request(api: apiRequest, responseType: CategoryCodeResponse.self)
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
    
    func fetchDetailImage(request:DetailImageRequest) {
        let apiRequest = EndPoint.detailImage1(request: request)
        
        
        apiService.request(api: apiRequest, responseType: DetailImageResponse.self)
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
    
    
    
    func fetchDetailCommon(request:DetailCommonRequest) {
        let apiRequest = EndPoint.detailCommon1(request: request)
        
        
        apiService.request(api: apiRequest, responseType: DetailCommonResponse.self)
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
    
    func fetchDetailIntro(request:DetailIntroRequest) {
        let apiRequest = EndPoint.detailIntro1(request: request)
        
        
        apiService.request(api: apiRequest, responseType: DetailIntroResponse.self)
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
    
    func fetchDetailInfo(request:DetailInfoRequest) {
        let apiRequest = EndPoint.detailInfo1(request: request)
        
        apiService.request(api: apiRequest, responseType: DetailInfoResponse.self)
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
