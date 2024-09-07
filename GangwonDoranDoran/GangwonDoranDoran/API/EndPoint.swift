//
//  EndPoint.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/7/24.
//

import Foundation


enum EndPoint: Router {
    case locationBasedList1(request: LocationBasedListRequest)
    
    var baseURL: String {
        return "https://apis.data.go.kr/B551011/KorService1"
    }

    var path: String {
        switch self {
        case .locationBasedList1:
            return "/locationBasedList1"
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
        }
    }

    var encoding: ParameterEncoding {
        return .url
    }
}
