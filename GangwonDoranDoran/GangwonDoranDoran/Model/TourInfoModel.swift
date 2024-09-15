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

struct DetailImageRequest {
    let baseRequest: BaseRequest
    let contentId: String
    
    var imageYN: Int?
    var subImageYN: Int?
    var numOfRows: String?
    var pageNo: String?

    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["contentId"] = contentId
        
        if let imageYN = imageYN {
            params["imageYN"] = imageYN
        }
        if let subImageYN = subImageYN {
            params["subImageYN"] = subImageYN
        }
        
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }

 
        return params
        
        
    }
    
    
}

struct DetailCommonRequest {
    let baseRequest: BaseRequest
    let contentId: String
    
    
    var contentTypeId: String?
    var defaultYN: String?
    var firstImageYN: String?
    var areacodeYN: String?
    var catcodeYN: String?
    var addrinfoYN: String?
    var mapinfoYN: String?
    var overviewYN: String?
    var numOfRows: String?
    var pageNo: String?
    
    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["contentId"] = contentId
        
        if let contentTypeId = contentTypeId {
            params["contentTypeId"] = contentTypeId
        }
        if let defaultYN = defaultYN {
            params["defaultYN"] = defaultYN
        }
        
        if let firstImageYN = firstImageYN {
            params["firstImageYN"] = firstImageYN
        }
        if let areacodeYN = areacodeYN {
            params["areacodeYN"] = areacodeYN
        }
        if let mapinfoYN = mapinfoYN {
            params["mapinfoYN"] = mapinfoYN
        }
        if let overviewYN = overviewYN {
            params["overviewYN"] = overviewYN
        }
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }
       
        return params
    }
}

struct DetailIntroRequest {
    let baseRequest: BaseRequest
    let contentId: String
    let contentTypeId: String
    
    var numOfRows: String?
    var pageNo: String?

    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["contentId"] = contentId
        params["contentTypeId"] = contentTypeId
        
    
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }

        return params
        
    }
}

struct DetailInfoRequest {
    let baseRequest: BaseRequest
    let contentId: String
    let contentTypeId: String
    
    var numOfRows: String?
    var pageNo: String?

    func toParameter() -> [String:Any] {
        var params = baseRequest.toParameters()
        
        params["contentId"] = contentId
        params["contentTypeId"] = contentTypeId
        
    
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }

        return params
        
    }
}

struct AreaBasedSyncListRequest {
    let baseRequest: BaseRequest

    
    var numOfRows: String?
    var pageNo: String?
    var showflag: String?
    var modifiedtime: String?
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
        
        if let numOfRows = numOfRows {
            params["numOfRows"] = numOfRows
        }
        if let pageNo = pageNo {
            params["pageNo"] = pageNo
        }
        if let showflag = showflag {
            params["showflag"] = showflag
        }
        if let modifiedtime = modifiedtime {
            params["modifiedtime"] = modifiedtime
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
        
        if let sigunguCode = sigunguCode {
            params["sigunguCode"] = sigunguCode
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

struct DetailImageResponse: Decodable {
    let header: Header
    let body: Body
    
    struct Header: Decodable {
        let resultCode: String
        let resultMsg: String
    }
    
    struct Body: Decodable {
        let numOfRows: Int
        let pageNo: Int
        let totalCount: Int
        let items: Items
    }
    
    struct Items: Decodable {
        let item: Item
    }
    
    struct Item: Decodable {
        let contentid: String
        let imgname: String
        let originimgurl: String
        let serialnum: String
        let smallimageurl: String
        let cpyrhtDivCd: String
    }
}

struct DetailCommonResponse: Decodable {
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
        let overview: String
        let contentid: String
        let sigungucode: String
        let cat1: String
        let cat2: String
        let cat3: String
        let addr1: String
        let addr2: String
        let zipcode: String
        let mapx: String
        let mapy: String
        let mlevel: String
        let cpyrhtDivCd: String
        let contenttypeid: String
        let booktour: String
        let createdtime: String
        let homepage: String
        let modifiedtime: String
        let tel: String
        let telname: String
        let title: String
        let firstimage: String
        let firstimage2: String
        let areacode: String
    }
}

struct DetailIntroResponse: Decodable {
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
        let numOfRows: Int
        let totalCount: Int
        let items: Items
        let pageNo: Int
    }

    struct Items: Decodable {
        let item: Item
    }

    struct Item: Decodable {
        let chkcreditcardculture: String
        let scaleleports: String
        let usefeeleports: String
        let discountinfofestival: String
        let chkcreditcardfood: String
        let eventenddate: String
        let playtime: String
        let chkbabycarriageculture: String
        let roomcount: String
        let reservationlodging: String
        let reservationurl: String
        let roomtype: String
        let scalelodging: String
        let subfacility: String
        let barbecue: String
        let beauty: String
        let beverage: String
        let bicycle: String
        let campfire: String
        let fitness: String
        let placeinfo: String
        let parkinglodging: String
        let pickup: String
        let publicbath: String
        let opendate: String
        let parking: String
        let restdate: String
        let usetimeleports: String
        let foodplace: String
        let goodstay: String
        let hanok: String
        let infocenterlodging: String
        let eventhomepage: String
        let eventplace: String
        let parkingleports: String
        let reservation: String
        let restdateleports: String
        let eventstartdate: String
        let festivalgrade: String
        let karaoke: String
        let discountinfofood: String
        let firstmenu: String
        let infocenterfood: String
        let kidsfacility: String
        let opendatefood: String
        let opentimefood: String
        let packing: String
        let parkingfood: String
        let reservationfood: String
        let restdatefood: String
        let scalefood: String
        let seat: String
        let smoking: String
        let treatmenu: String
        let lcnsno: String
        let contentid: String
        let contenttypeid: String
        let accomcount: String
        let chkbabycarriage: String
        let chkcreditcard: String
        let chkpet: String
        let expagerange: String
        let expguide: String
        let heritage1: String
        let heritage2: String
        let heritage3: String
        let infocenter: String
        let taketime: String
        let theme: String
        let accomcountleports: String
        let chkbabycarriageleports: String
        let chkcreditcardleports: String
        let chkpetleports: String
        let expagerangeleports: String
        let infocenterleports: String
        let openperiod: String
        let parkingfeeleports: String
        let program: String
        let spendtimefestival: String
        let sponsor1: String
        let sponsor1tel: String
        let chkpetculture: String
        let discountinfo: String
        let infocenterculture: String
        let parkingculture: String
        let parkingfee: String
        let restdateculture: String
        let usefee: String
        let usetimeculture: String
        let scale: String
        let spendtime: String
        let agelimit: String
        let bookingplace: String
        let useseason: String
        let usetime: String
        let accomcountculture: String
        let sponsor2: String
        let sponsor2tel: String
        let subevent: String
        let usetimefestival: String
        let distance: String
        let infocentertourcourse: String
        let schedule: String
        let publicpc: String
        let sauna: String
        let seminar: String
        let sports: String
        let refundregulation: String
        let chkbabycarriageshopping: String
        let chkcreditcardshopping: String
        let chkpetshopping: String
        let culturecenter: String
        let fairday: String
        let infocentershopping: String
        let opendateshopping: String
        let opentime: String
        let parkingshopping: String
        let restdateshopping: String
        let restroom: String
        let saleitem: String
        let saleitemcost: String
        let scaleshopping: String
        let shopguide: String
        let checkintime: String
        let checkouttime: String
        let chkcooking: String
        let accomcountlodging: String
        let benikia: String
    }
}


struct DetailInfoResponse: Decodable {
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
        let numOfRows: Int
        let pageNo: Int
        let totalCount: Int
        let items: Items
    }

    struct Items: Decodable {
        let item: Item
    }

    struct Item: Decodable {
        let roomimg4: String
        let roomtoiletries: String
        let roomsofa: String
        let roomcook: String
        let roomtable: String
        let roomimg5alt: String
        let contentid: String
        let contenttypeid: String
        let fldgubun: String
        let infoname: String
        let infotext: String
        let serialnum: String
        let subcontentid: String
        let subdetailalt: String
        let subdetailimg: String
        let subdetailoverview: String
        let subname: String
        let subnum: String
        let roomcode: String
        let roomtitle: String
        let roomsize1: String
        let roomcount: String
        let roombasecount: String
        let roommaxcount: String
        let roomoffseasonminfee1: String
        let roomoffseasonminfee2: String
        let roompeakseasonminfee1: String
        let roompeakseasonminfee2: String
        let roomintro: String
        let roombathfacility: String
        let roombath: String
        let roomhometheater: String
        let roomaircondition: String
        let roomtv: String
        let roompc: String
        let roomcable: String
        let roominternet: String
        let roomrefrigerator: String
        let roomimg5: String
        let roomimg3: String
        let roomimg4alt: String
        let roomimg3alt: String
        let roomhairdryer: String
        let roomsize2: String
        let roomimg2alt: String
        let roomimg1: String
        let roomimg1alt: String
        let roomimg2: String
        let cpyrhtDivCd1: String
        let cpyrhtDivCd2: String
        let cpyrhtDivCd3: String
        let cpyrhtDivCd4: String
        let cpyrhtDivCd5: String
    }
}

struct AreaBasedSyncListResponse: Decodable {
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
        let mapx: String
        let mapy: String
        let mlevel: String
        let modifiedtime: String
        let showflag: String
        let sigungucode: String
        let tel: String
        let title: String
        let addr1: String
        let addr2: String
        let areacode: String
        let booktour: String
        let cat1: String
        let cat2: String
        let cat3: String
        let contentid: String
        let contenttypeid: String
        let createdtime: String
        let cpyrhtDivCd: String
        let firstimage: String
        let firstimage2: String
        let zipcode: String
    }
}
