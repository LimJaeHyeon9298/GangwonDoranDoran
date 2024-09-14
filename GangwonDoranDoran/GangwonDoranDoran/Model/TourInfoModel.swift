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

struct SearchKeywordRequest {
    let baseRequest: BaseRequest
    var keyword: String
    
    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var contentTypeId: String?
    var areaCode: String?
    var sigunguCode: String?
    var cat1: String?
    var cat2: String?
    var cat3: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["keyword"] = keyword
        
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
        if let areaCode = areaCode {
            params["areaCode"] = areaCode
        }
        
        if let cat1 = cat1 {
            params["cat1"] = cat1
        }
        
        if let cat2 = cat2 {
            params["cat2"] = cat2
        }
        
        if let cat3 = cat3 {
            params["cat3"] = cat3
        }
        
        return params
        
        
    }
    
    
}

struct SearchFestivalRequest {
    let baseRequest: BaseRequest
    let eventStartDate: String
    
    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var eventEndDate: String?
    var areaCode: String?
    var sigunguCode: String?
    var modifiedtime: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["eventStartDate"] = eventStartDate
        
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
        if let eventEndDate = eventEndDate {
            params["eventEndDate"] = eventEndDate
        }
        if let areaCode = areaCode {
            params["areaCode"] = areaCode
        }
        
        if let modifiedtime = modifiedtime {
            params["modifiedtime"] = modifiedtime
        }
        
        return params
    }
    
}


struct SearchStayRequest {
    let baseRequest: BaseRequest
    
    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var areaCode: String?
    var sigunguCode: String?
    var modifiedtime: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        
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

        if let areaCode = areaCode {
            params["areaCode"] = areaCode
        }
        
        if let modifiedtime = modifiedtime {
            params["modifiedtime"] = modifiedtime
        }
        
        return params
    }
}


struct DetailPetTourRequest {
    let baseRequest: BaseRequest
    
    var numOfRows: Int?
    var pageNo: Int?
    var arrange: String?
    var contentId: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }

        if let contentId = contentId {
            params["contentId"] = contentId
        }
        
        return params
    }
}



struct AreaBasedListRequest {
    let baseRequest: BaseRequest
    
    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var contentTypeId: String?
    var areaCode: String?
    var sigunguCode: String?
    var cat1: String?
    var cat2: String?
    var cat3: String?
    var modifiedtime: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
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
        if let areaCode = areaCode {
            params["areaCode"] = areaCode
        }
        
        if let cat1 = cat1 {
            params["cat1"] = cat1
        }
        
        if let cat2 = cat2 {
            params["cat2"] = cat2
        }
        
        if let cat3 = cat3 {
            params["cat3"] = cat3
        }
        
        if let modifiedtime = modifiedtime {
            params["modifiedtime"] = modifiedtime
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

struct CategoryCodeRequest {
    let baseRequest: BaseRequest
    
    var numOfRows: Int?
    var pageNo: Int?
    var listYN: String?
    var arrange: String?
    var contentTypeId: String?
    var cat1: String?
    var cat2: String?
    var cat3: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
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
        
        if let cat1 = cat1 {
            params["cat1"] = cat1
        }
        
        if let cat2 = cat2 {
            params["cat2"] = cat2
        }
        
        if let cat3 = cat3 {
            params["cat3"] = cat3
        }
        
        return params
        
        
    }
    
    
}


struct SearchKeywordResponse: Codable {
    let header: String
    let body: Body

    struct Body: Codable {
        let items: Items
    }

    struct Items: Codable {
        let item: Item
    }

    struct Item: Codable {
        let firstimage: String
        let sigungucode: String
        let cat1: String
        let cat2: String
        let cat3: String
        let contentid: String
        let booktour: String
        let tel: String
        let title: String
        let addr1: String
        let areacode: String
        let mapy: String
        let mlevel: String
        let modifiedtime: String
        let firstimage2: String
        let mapx: String
        let contenttypeid: String
        let addr2: String
        let createdtime: String
        let cpyrhtDivCd: String
    }
}


struct FestivalInfoResponse: Codable {
    let header: Header
    let body: Body

    struct Header: Codable {
        let resultCode: String
        let resultMsg: String
    }

    struct Body: Codable {
        let items: Items
    }

    struct Items: Codable {
        let item: Item
    }

    struct Item: Codable {
        let firstimage: String
        let sigungucode: String
        let cat1: String
        let cat2: String
        let cat3: String
        let contentid: String
        let booktour: String
        let tel: String
        let title: String
        let addr1: String
        let areacode: String
        let mapy: String
        let mlevel: String
        let modifiedtime: String
        let firstimage2: String
        let mapx: String
        let contenttypeid: String
        let addr2: String
        let createdtime: String
        let cpyrhtDivCd: String
    }
}

struct StayInfoResponse: Codable {
    let header: Header
    let body: Body

    struct Header: Codable {
        let resultCode: String
        let resultMsg: String
    }

    struct Body: Codable {
        let items: Items
    }

    struct Items: Codable {
        let item: Item
    }

    struct Item: Codable {
        let addr1: String
        let cpyrhtDivCd: String
        let mapy: String
        let mlevel: String
        let modifiedtime: String
        let sigungucode: String
        let tel: String
        let title: String
        let contentid: String
        let contenttypeid: String
        let createdtime: String
        let benikia: String
        let goodstay: String
        let hanok: String
        let firstimage: String
        let firstimage2: String
        let mapx: String
        let addr2: String
        let areacode: String
        let booktour: String
        let cat1: String
        let cat2: String
        let cat3: String
    }
}


struct DetailPetTourResponse: Decodable {
    let response: Response

    struct Response: Decodable {
        let header: Header
        let body: Body
    }

    struct Header: Decodable {
        let resultMsg: String
        let resultCode: String
    }

    struct Body: Decodable {
        let totalCount: String
        let numOfRows: String
        let pageNo: String
        let items: Items
    }

    struct Items: Decodable {
        let item: Item
    }

    struct Item: Decodable {
        let acmpyPsblCpam: String
        let relaRntlPrdlst: String
        let acmpyNeedMtr: String
        let relaFrnshPrdlst: String
        let etcAcmpyInfo: String
        let relaPurcPrdlst: String
        let relaAcdntRiskMtr: String
        let acmpyTypeCd: String
        let relaPosesFclty: String
        let contentid: String
        let petTursmInfo: String
    }
}

struct AreaBasedListResponse: Decodable {
    let header: Header
    let body: Body

    struct Header: Decodable {
        let resultCode: String
        let resultMsg: String
    }

    struct Body: Decodable {
        let items: Items
    }

    struct Items: Decodable {
        let item: Item
    }

    struct Item: Decodable {
        let firstimage: String
        let firstimage2: String
        let mapx: String
        let mapy: String
        let mlevel: String
        let addr2: String
        let areacode: String
        let modifiedtime: String
        let cpyrhtDivCd: String
        let booktour: String
        let cat1: String
        let sigungucode: String
        let tel: String
        let title: String
        let addr1: String
        let cat2: String
        let cat3: String
        let contentid: String
        let contenttypeid: String
        let createdtime: String
        let zipcode: String
    }
}


struct CategoryCodeResponse: Decodable {
    let response: Response

    struct Response: Decodable {
        let header: Header
        let body: Body
    }

    struct Header: Decodable {
        let resultCode: String
        let resultMsg: String
    }

    struct Body: Decodable {
        let items: Items
        let numOfRows: Int
        let pageNo: Int
        let totalCount: Int
    }

    struct Items: Decodable {
        let item: [Item]
    }

    struct Item: Decodable {
        let code: String
        let name: String
        let rnum: Int
    }
}
