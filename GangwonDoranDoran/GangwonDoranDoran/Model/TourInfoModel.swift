//
//  TourInfoModel.swift
//  GangwonDoranDoran
//
//  Created by 임재현 on 9/7/24.
//

import Foundation

struct BaseRequest {
    let serviceKey: String
    let mobileOS: String
    let mobileApp: String
    let responseType: String
        
    init(serviceKey: String = "SecretKey",
         
         mobileOS: String = "IOS",
         mobileApp: String = "AppTest",
         responseType: String = "json") {
        self.serviceKey = serviceKey
        self.mobileOS = mobileOS
        self.mobileApp = mobileApp
        self.responseType = responseType
    }

    // 공통 파라미터를 딕셔너리로 반환
    func toParameters() -> [String: Any] {
        return [
            "serviceKey": serviceKey,
            "MobileOS": mobileOS,
            "MobileApp": mobileApp,
            "_type": responseType // 항상 "json"으로 설정
        ]
    }
}


struct LocationBasedListRequest {
    let baseRequest: BaseRequest
    let mapX: String
    let mapY: String
    let radius: String

    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var contentTypeId: String?
    var modifiedTime: String?

    func toParameters() -> [String: Any] {
        var params = baseRequest.toParameters()

        params["mapX"] = mapX
        params["mapY"] = mapY
        params["radius"] = radius

        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }

        if let listYN = listYN {
            params["listYN"] = listYN
        }
        if let arrange = arrange {
            params["arrange"] = arrange
        }
        if let contentTypeId = contentTypeId {
            params["contentTypeId"] = contentTypeId
        }
        if let modifiedTime = modifiedTime {
            params["modifiedtime"] = modifiedTime
        }

        return params
    }
}


struct LocationBasedListResponse: Codable {
    let response: ResponseData

    struct ResponseData: Codable {
        let header: ResponseHeader
        let body: ResponseBody
    }

    struct ResponseHeader: Codable {
        let resultCode: String
        let resultMsg: String
    }

    struct ResponseBody: Codable {
        let items: Items
        let numOfRows: Int
        let pageNo: Int
        let totalCount: Int
    }

    struct Items: Codable {
        let item: [Item]
    }

    struct Item: Codable {
        let contentid: String
        let addr2: String
        let firstimage2: String
        let cpyrhtDivCd: String
        let addr1: String
        let contenttypeid: String
        let createdtime: String
        let dist: String
        let firstimage: String
        let areacode: String
        let booktour: String
        let mapx: String
        let mapy: String
        let mlevel: String
        let modifiedtime: String
        let sigungucode: String
        let tel: String
        let title: String
        let cat1: String
        let cat2: String
        let cat3: String
    }
}
