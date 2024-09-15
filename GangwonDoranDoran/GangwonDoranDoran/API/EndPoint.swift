//
//  EndPoint.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/7/24.
//

import Foundation


enum EndPoint: Router {
    case locationBasedList1(request: LocationBasedListRequest)
    case searchKeyword1(request: SearchKeywordRequest)
    case searchFestival1(request: SearchFestivalRequest)
    case searchStay1(request: SearchStayRequest)
    case detailPetTourInfo(request: DetailPetTourRequest)
    case areaBasedList1(request:AreaBasedListRequest)
    case categoryCode(request:CategoryCodeRequest)
    case detailImage1(request:DetailImageRequest)
    case detailCommon1(request: DetailCommonRequest)
    case detailIntro1(request: DetailIntroRequest)
    case detailInfo1(request: DetailInfoRequest)
    
    
    var baseURL: String {
        return "https://apis.data.go.kr/B551011/KorService1"
    }

    var path: String {
        switch self {
        case .locationBasedList1:
            return "/locationBasedList1"
        case .searchKeyword1:
            return "/searchKeyword1"
        case .searchFestival1:
            return "/searchFestival1"
        case .searchStay1:
            return "/searchStay1"
        case .detailPetTourInfo:
            return "/detailPetTour1"
        case .areaBasedList1:
            return "/areaBasedList1"
        case .categoryCode:
            return "/categoryCode1"
        case .detailImage1:
            return "/detailImage1"
        case .detailCommon1:
            return "/detailCommon1"
        case .detailIntro1:
            return "/detailIntro1"
        case .detailInfo1:
            return "/detailInfo1"
        }
    }

    var method: HTTPMethod {
        return .get
    }

    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }

    var parameters: [String: Any] {
        switch self {
        case .locationBasedList1(let request):
            return request.toParameters()
        case .searchKeyword1(request: let request):
            return request.toParameter()
        case .searchFestival1(request: let request):
            return request.toParameter()
        case .searchStay1(request: let request):
            return request.toParameter()
        case .detailPetTourInfo(request: let request):
            return request.toParameter()
        case .areaBasedList1(request: let request):
            return request.toParameter()
        case .categoryCode(request: let request):
            return request.toParameter()
        case .detailImage1(request: let request):
            return request.toParameter()
        case .detailCommon1(request: let request):
            return request.toParameter()
        case .detailIntro1(request: let request):
            return request.toParameter()
        case .detailInfo1(request: let request):
            return request.toParameter()
        }
    }

    var encoding: ParameterEncoding {
        return .url
    }
}
